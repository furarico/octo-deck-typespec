namespace OctoDeckApi {
  model Card {
    id: string;
    userName: string;
    fullName: string;
    iconUrl: string;
    identicon: Identicon;
  }
  model Identicon {
    /**
     * カラーコード 例: #RRGGBB
     */
    color: string;

    /**
     * 5x5の二次元配列。trueがブロック
     */
    blocks: boolean[][];
  }
}
