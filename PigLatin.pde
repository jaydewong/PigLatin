public void setup() //why is it adding ay??
{
  String[] lines = loadStrings("LowellHymn.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) 
  {
    String[] words = split(lines[i], ' ');
    for(int j = 0; j< words.length; j++){
      if(hasComma(words[j]) == true){
        System.out.print(pigLatin(words[j]) + "\n");
      }else {
        System.out.print(pigLatin(words[j]) + " ");
        }
    }
  }
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord) 
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
  
{
 for(int i = 0; i < sWord.length(); i++){
    if(sWord.substring(i, i+1).equals("a") || sWord.substring(i, i+1).equals("A") || sWord.substring(i, i+1).equals("e") || sWord.substring(i, i+1).equals("E")|| sWord.substring(i, i+1).equals("i") || sWord.substring(i, i+1).equals("I") || sWord.substring(i, i+1).equals("o") || sWord.substring(i, i+1).equals("O")|| sWord.substring(i, i+1).equals("u") || sWord.substring(i, i+1).equals("U")){
      return i;
    }
  }
  return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  if(findFirstVowel(sWord) == -1)
  {
    if(hasComma(sWord) == true){
      return sWord.substring(0, sWord.length()-1) + "ay" + sWord.substring(sWord.length()-1);
    }
    return sWord + "ay"; //HERES THE AY PROBLEM
  } 
  if(findFirstVowel(sWord) == 0)
  {
    if(hasComma(sWord) == true){
    return sWord.substring(0, sWord.length()-1) + "way" + sWord.substring(sWord.length()-1);
    }
    else
    return sWord + "way";
    
  }
  if(sWord.substring(0,2).equals("qu")){
    if(hasComma(sWord) == true){
    return sWord.substring(2, sWord.length() -1) + sWord.substring(0,2) + "ay" + sWord.substring(sWord.length()-1);
    }
    return sWord.substring(2) + sWord.substring(0,2) + "ay";
  }
  else if(hasComma(sWord) == true){
  return sWord.substring(findFirstVowel(sWord), sWord.length()-1) + sWord.substring(0, findFirstVowel(sWord)) + "ay" + sWord.substring(sWord.length() -1, sWord.length());
  }
  return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
}// add an if has comma here 


public boolean hasComma(String sWord){
  for (int i = 0 ; i < sWord.length(); i++){
    if(sWord.substring(i, i+1).equals(",") || sWord.substring(i, i+1).equals(".")){
      return true;
    }
    
  }
  return false;
  
}
