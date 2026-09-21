/*
 * Stack implementation based on a singly linked list (Java version of stack.h/stack.c)
 */

public class Stack implements StackInterface {

    private Element head;

    public Stack() {
        head = null;
    }

    public void push(Element e) {
        e.setNext(head);
        head = e;
    }

    public Element top() {
        if (isEmpty()) {
            System.out.println("ERROR - top: stack empty!");
            return null;
        }
        return head;
    }

    public boolean pop() {
        if (isEmpty()) {
            return false;
        }
        head = head.getNext();
        return true;
    }

    public boolean isEmpty() {
        return head == null;
    }

    public int size() {
        int count = 0;
        Element current = head;
        while (current != null) {
            count++;
            current = current.getNext();
        }
        return count;
    }

    public void print() {
        if (isEmpty()) {
            System.out.println("print - Stack is empty");
        } else {
            StringBuilder sb = new StringBuilder("print - Stack contains (top to bottom): ");
            Element current = head;
            while (current != null) {
                sb.append(current.getValue());
                if (current.getNext() != null) {
                    sb.append(", ");
                }
                current = current.getNext();
            }
            sb.append(" | top element = ").append(head.getValue());
            System.out.println(sb);
        }
    }
}
