# Firebase RealtimeDB를 활용한 실시간 채팅앱

## 구현
- RealtimeDB를 활용하여 실시간 채팅 앱 구현

https://github.com/jihoooo97/Practice_Chat_withRealtimeDB/assets/49361214/e3d88f61-fac3-4834-820b-588490271ca8

<br>

## 겪은 문제
1. RealtimeDB에서 데이터를 받아오는 중, struct로 받아오질 못하는 문제
2. struct를 RealtimeDB로 update할 수 없는 문제

<br>

## 해결 방법
**1. RealtimeDB에서 기본 데이터타입이 아닌 struct로 받고 싶다면**  
-> Dictionary로 받고 JSONSerialization으로 data 타입으로 변환한 뒤 구조체로 decoding 한다.
  
  ```swift
  guard let value = snapshot.value as? [[String: Any]]
  else { return }

  guard let data = try? JSONSerialization.data(withJSONObject: value),
        let responseData = try? JSONDecoder().decode([MessageModel].self, from: data)

  self?.chatList = responseData
  ```
<br>

**2. struct를 RealtimeDB로 전송하고 싶다면**  
-> encoing 하고 JSONSerialization으로 Dictionary로 변환한 뒤 전송한다.

  ```swift
  guard let data = try? JSONEncoder().encode(chatList),
        let dictionary = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
  else {
      throw ChatError.encodingError
  }

  databaseRef.child("chattingList").setValue(dictionary)
  ```

<br>
  
## 아쉬운 점
- 같은 사람이 여러번 채팅을 보낼 시 프로필을 1개만 보이도록 처리
