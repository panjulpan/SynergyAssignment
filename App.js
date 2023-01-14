import {StyleSheet, TextInput, View} from 'react-native';
import React, {useState} from 'react';
import SharedGroupPreferences from 'react-native-shared-group-preferences';

const group = 'group.assignment';

const App = () => {
  const [inputText, setInputText] = useState('');
  const widgetData = {
    inputText,
  };

  const submitText = async () => {
    try {
      await SharedGroupPreferences.setItem('widgetKey', widgetData, group);
    } catch (error) {
      console.log('error submitting data: ', error);
    }
  };

  return (
    <View style={styles.container}>
      <TextInput
        style={styles.input}
        onChangeText={input => setInputText(input)}
        value={inputText}
        returnKeyType="send"
        onEndEditing={submitText}
        placeholder="Enter text to display in the widget"
      />
    </View>
  );
};

export default App;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 24,
    justifyContent: 'center',
  },
  input: {
    width: '100%',
    borderBottomWidth: 1,
    fontSize: 18,
  },
});
