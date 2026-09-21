/**
 * Interface for a PCP stack implementation.
 */
interface StackInterface {

    /**
     * Adds an element to the top of the stack.
     *
     * @param e the element to add
     */
    public void push(Element e);

    /**
     * Returns the top element of the stack without removing it.
     *
     * @return the top element, or {@code null} if the stack is empty
     */
    public Element top();

    /**
     * Removes the top element from the stack.
     */
    public boolean pop();

    /**
     * Checks whether the stack contains no elements.
     *
     * @return {@code true} if the stack is empty, {@code false} otherwise
     */
    public boolean isEmpty();

    /**
     * Returns the number of elements currently on the stack.
     *
     * @return the number of elements
     */
    public int size();

    /**
     * Prints all elements of the stack.
     */
    public void print();
}
