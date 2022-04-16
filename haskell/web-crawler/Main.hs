{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.ByteString.Lazy.Char8 as L8
import qualified System.IO as IO
import Data.List (filter, isPrefixOf)
import Control.Monad.IO.Class (MonadIO)
import Network.HTTP.Simple (Request, Response, parseRequest, httpLBS, getResponseHeader, getResponseBody)

type ISBN = String
type URL = String
type Title = String
type Contents = L8.ByteString
type ResponseBody = L8.ByteString

main :: IO ()
main = do
  isbnDump <- IO.readFile "./ebook-isbns.txt"
  processIsbnList $ lines isbnDump

processIsbnList :: [ISBN] -> IO ()
processIsbnList [] = print (" --- DONE, ENJOY READING --- ")
processIsbnList (x:xs) = do
  print ("Processing isbn : " ++ x ++ " (" ++ show (length xs) ++ " remaining)")
  pageReq <- parseRequest ("http://link.springer.com/openurl?genre=book&isbn=" ++ x)
  print ("Getting download link...")
  pageResponse <- download pageReq
  print ("Received download link")
  downloadReq <- parseRequest (getPdfUrl $ getResponseBody pageResponse)
  print ("Downloading book...")
  downloadRes <- download downloadReq
  print ("Downloaded book")
  let title = getBookTitle downloadRes
  print ("Saving as " ++ title ++ ".pdf")
  print ("---")
  writePdf (title, getResponseBody downloadRes)
  processIsbnList xs

getBookTitle :: Response a -> Title
getBookTitle res = takeWhile (/= '.')
  $ drop 11
  $ show (getResponseHeader "Content-Disposition" res)

getPdfUrl :: ResponseBody -> URL
getPdfUrl body =  "http://link.springer.com" ++ (
  takeWhile (/= '\"')
  $ drop 6
  $ head
  $ filter ("href=\"/content" `isPrefixOf`)
  $ words
  $ L8.unpack body)

download :: MonadIO m => Request -> m (Response L8.ByteString)
download url = do
  response <- httpLBS url
  return response

writePdf :: (Title, Contents) -> IO ()
writePdf (title, contents) = do
  handle <- IO.openFile (title ++ ".pdf") IO.WriteMode
  L8.hPutStr handle contents
