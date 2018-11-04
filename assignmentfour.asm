#Assembly Assignment Four
#Finding Largest in an Array
#jose perales
# a function which finds the largest value in an array of integer



.data
    array:    .word   3,  6,  223,  7,  118, 201
    number:   .word  6
.text

  main:
    la    $t0,   array            # base address of the first  array
    lw    $t1,   number           # length of the first array
    addi  $t2,   $zero,  0        # this is the counter
    addi  $s0,   $zero,  0        # This is the current biggest number for holding


#This the start of the function "largest"
  largest:
    beq   $t1,   $t2,    end      # when the counter hits the length, exit the loop which is the length of the first array.while( index < arrayLength)
    sll   $t3,   $t2,    2        # multiply counter by 4
    add   $t4,   $t0,    $t3      # add it to the base address
    lw    $t5,   0 ( $t4)         # grab the value from the array
    addi  $t2,   $t2,    1        # increment the counter
    slt   $s3,   $s0,   $t5       # is the current < than what is the current value in t5?
    beq   $s3,  $zero, largest    # if not, repeat/jump back to largest with no change
    add   $s0, $zero, $t5         # if so, t5 is the new largest in the array.
    j     largest



  end:
    li    $v0,   1                # Print out the largets number in the array elements
    addi  $a0,  $s1, 0
    syscall
    nop
