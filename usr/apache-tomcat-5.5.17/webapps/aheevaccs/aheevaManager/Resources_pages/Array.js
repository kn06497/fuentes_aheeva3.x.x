/**
 * @classDescription : Add some functions(@see sort, )
 * 					to the Array class 
 * @extends Array
 * @author Gildas
 * 
 */ 

/**
 * Implements clear, which empties an array.
 * @usage : myArr = new Array('test', 'test2'); myArr.clear()
 */
Array.prototype.clear=function()
  {
      this.length = 0;
  };
  /**
   * Implements contains, which checks weither the specified element exists in 
   * the array or not. 
   * @param {Object} element : The element to search
   * @usage : myArr = new ew Array('test', 'test2'); 
   * 				  myArr.contains('test') returns true 
   */
  Array.prototype.contains = function (element) 
  {
          for (var i = 0; i < this.length; i++) 
       {
              if (this[i] == element) 
          {
                      return true;
              }
          }
          return false;
  }; 
  /**
   * Shuffles the Array elements randomly
   */  
 Array.prototype.shuffle=function()
 {
     var i=this.length,j,t;
     while(i--)
     {
         j=Math.floor((i+1)*Math.random());
         t=arr[i];
         arr[i]=arr[j];
         arr[j]=t;
     }
 }
 /**
  * Removes redundant elements from the array
  * @return {Array} An array containing a unique value of 
  * distinct values of elements of the current object
  */ 
 Array.prototype.unique=function()
 {
     var a=[],i;
     this.sort();
     for(i=0;i<this.length;i++)
     {
         if(this[i]!==this[i+1])
         {
             a[a.length]=this[i];
         }
     }
     return a;
 }
 /**
  * Returns the index of the last element thats matches
  * @param {Object} n : The object to look for
  * @return {int} : The value of the index of the last object that matches 
  */ 
 Array.prototype.lastIndexOf=function(n)
 {
     var i=this.length;
     while(i--)
     {
         if(this[i]===n)
         {
             return i;
         }
     }
     return -1;
 }  