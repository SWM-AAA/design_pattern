// p.215
package chapter05.doyeon.practice;
// 필요할때 생성하지 않고, 처응ㅁ부터 만드는 방법

// 장점 : 인스턴스를 생성하고 계속 사용하거나, 인스턴스를 수시로 만들고 관리할때
// 단점 : 클라스가 엄청 크면, 사용하지 않더라도 용량을 잡아먹는다.????? 확인ㅇ필요
public class MakeFirst {
    // 정적 초기화 부분에서 인스턴스 생성
    private static MakeFirst uniqueInstance = new MakeFirst();

    private MakeFirst() {
    }

    public static MakeFirst getInstance() {
        return uniqueInstance;
    }

}
