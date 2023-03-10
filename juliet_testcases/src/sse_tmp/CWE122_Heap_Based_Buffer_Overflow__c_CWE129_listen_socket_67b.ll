; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType = type { i32 }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67b_badSink(i32 %myStruct.coerce) #0 !dbg !13 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0
  store i32 %myStruct.coerce, i32* %coerce.dive, align 4
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !25
  %0 = load i32, i32* %structFirst, align 4, !dbg !25
  store i32 %0, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %i, metadata !26, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !29, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %buffer, align 8, !dbg !30
  %2 = load i32*, i32** %buffer, align 8, !dbg !33
  %cmp = icmp eq i32* %2, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !42
  %cmp1 = icmp slt i32 %3, 10, !dbg !44
  br i1 %cmp1, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !46
  %5 = load i32, i32* %i, align 4, !dbg !48
  %idxprom = sext i32 %5 to i64, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %6, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !56
  %cmp2 = icmp sge i32 %7, 0, !dbg !58
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !59

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !60
  %9 = load i32, i32* %data, align 4, !dbg !62
  %idxprom4 = sext i32 %9 to i64, !dbg !60
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !60
  store i32 1, i32* %arrayidx5, align 4, !dbg !63
  store i32 0, i32* %i, align 4, !dbg !64
  br label %for.cond6, !dbg !66

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !67
  %cmp7 = icmp slt i32 %10, 10, !dbg !69
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !70

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !71
  %12 = load i32, i32* %i, align 4, !dbg !73
  %idxprom9 = sext i32 %12 to i64, !dbg !71
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !71
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !71
  call void @printIntLine(i32 %13), !dbg !74
  br label %for.inc11, !dbg !75

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !76
  %inc12 = add nsw i32 %14, 1, !dbg !76
  store i32 %inc12, i32* %i, align 4, !dbg !76
  br label %for.cond6, !dbg !77, !llvm.loop !78

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !80

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !81
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !83
  %16 = bitcast i32* %15 to i8*, !dbg !83
  call void @free(i8* %16) #5, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67b_goodG2BSink(i32 %myStruct.coerce) #0 !dbg !86 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0
  store i32 %myStruct.coerce, i32* %coerce.dive, align 4
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType* %myStruct, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32* %data, metadata !89, metadata !DIExpression()), !dbg !90
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !91
  %0 = load i32, i32* %structFirst, align 4, !dbg !91
  store i32 %0, i32* %data, align 4, !dbg !90
  call void @llvm.dbg.declare(metadata i32* %i, metadata !92, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !97
  %1 = bitcast i8* %call to i32*, !dbg !98
  store i32* %1, i32** %buffer, align 8, !dbg !96
  %2 = load i32*, i32** %buffer, align 8, !dbg !99
  %cmp = icmp eq i32* %2, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !108
  %cmp1 = icmp slt i32 %3, 10, !dbg !110
  br i1 %cmp1, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !112
  %5 = load i32, i32* %i, align 4, !dbg !114
  %idxprom = sext i32 %5 to i64, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !117
  %inc = add nsw i32 %6, 1, !dbg !117
  store i32 %inc, i32* %i, align 4, !dbg !117
  br label %for.cond, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !121
  %cmp2 = icmp sge i32 %7, 0, !dbg !123
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !124

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !125
  %9 = load i32, i32* %data, align 4, !dbg !127
  %idxprom4 = sext i32 %9 to i64, !dbg !125
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !125
  store i32 1, i32* %arrayidx5, align 4, !dbg !128
  store i32 0, i32* %i, align 4, !dbg !129
  br label %for.cond6, !dbg !131

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !132
  %cmp7 = icmp slt i32 %10, 10, !dbg !134
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !135

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !136
  %12 = load i32, i32* %i, align 4, !dbg !138
  %idxprom9 = sext i32 %12 to i64, !dbg !136
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !136
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !136
  call void @printIntLine(i32 %13), !dbg !139
  br label %for.inc11, !dbg !140

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !141
  %inc12 = add nsw i32 %14, 1, !dbg !141
  store i32 %inc12, i32* %i, align 4, !dbg !141
  br label %for.cond6, !dbg !142, !llvm.loop !143

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !145

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !146
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !148
  %16 = bitcast i32* %15 to i8*, !dbg !148
  call void @free(i8* %16) #5, !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67b_goodB2GSink(i32 %myStruct.coerce) #0 !dbg !151 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0
  store i32 %myStruct.coerce, i32* %coerce.dive, align 4
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType* %myStruct, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i32* %data, metadata !154, metadata !DIExpression()), !dbg !155
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !156
  %0 = load i32, i32* %structFirst, align 4, !dbg !156
  store i32 %0, i32* %data, align 4, !dbg !155
  call void @llvm.dbg.declare(metadata i32* %i, metadata !157, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !160, metadata !DIExpression()), !dbg !161
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !162
  %1 = bitcast i8* %call to i32*, !dbg !163
  store i32* %1, i32** %buffer, align 8, !dbg !161
  %2 = load i32*, i32** %buffer, align 8, !dbg !164
  %cmp = icmp eq i32* %2, null, !dbg !166
  br i1 %cmp, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !168
  unreachable, !dbg !168

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !170
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !173
  %cmp1 = icmp slt i32 %3, 10, !dbg !175
  br i1 %cmp1, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !177
  %5 = load i32, i32* %i, align 4, !dbg !179
  %idxprom = sext i32 %5 to i64, !dbg !177
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !177
  store i32 0, i32* %arrayidx, align 4, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !182
  %inc = add nsw i32 %6, 1, !dbg !182
  store i32 %inc, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !186
  %cmp2 = icmp sge i32 %7, 0, !dbg !188
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !189

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !190
  %cmp3 = icmp slt i32 %8, 10, !dbg !191
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !192

if.then4:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !193
  %10 = load i32, i32* %data, align 4, !dbg !195
  %idxprom5 = sext i32 %10 to i64, !dbg !193
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !193
  store i32 1, i32* %arrayidx6, align 4, !dbg !196
  store i32 0, i32* %i, align 4, !dbg !197
  br label %for.cond7, !dbg !199

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !200
  %cmp8 = icmp slt i32 %11, 10, !dbg !202
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !203

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !204
  %13 = load i32, i32* %i, align 4, !dbg !206
  %idxprom10 = sext i32 %13 to i64, !dbg !204
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !204
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !204
  call void @printIntLine(i32 %14), !dbg !207
  br label %for.inc12, !dbg !208

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !209
  %inc13 = add nsw i32 %15, 1, !dbg !209
  store i32 %inc13, i32* %i, align 4, !dbg !209
  br label %for.cond7, !dbg !210, !llvm.loop !211

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !213

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !214
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !216
  %17 = bitcast i32* %16 to i8*, !dbg !216
  call void @free(i8* %17) #5, !dbg !217
  ret void, !dbg !218
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67b_badSink", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType", file: !14, line: 45, baseType: !18)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67_structType", file: !14, line: 42, size: 32, elements: !19)
!19 = !{!20}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !18, file: !14, line: 44, baseType: !5, size: 32)
!21 = !DILocalVariable(name: "myStruct", arg: 1, scope: !13, file: !14, line: 49, type: !17)
!22 = !DILocation(line: 49, column: 148, scope: !13)
!23 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 51, type: !5)
!24 = !DILocation(line: 51, column: 9, scope: !13)
!25 = !DILocation(line: 51, column: 25, scope: !13)
!26 = !DILocalVariable(name: "i", scope: !27, file: !14, line: 53, type: !5)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 52, column: 5)
!28 = !DILocation(line: 53, column: 13, scope: !27)
!29 = !DILocalVariable(name: "buffer", scope: !27, file: !14, line: 54, type: !4)
!30 = !DILocation(line: 54, column: 15, scope: !27)
!31 = !DILocation(line: 54, column: 31, scope: !27)
!32 = !DILocation(line: 54, column: 24, scope: !27)
!33 = !DILocation(line: 55, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !14, line: 55, column: 13)
!35 = !DILocation(line: 55, column: 20, scope: !34)
!36 = !DILocation(line: 55, column: 13, scope: !27)
!37 = !DILocation(line: 55, column: 30, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !14, line: 55, column: 29)
!39 = !DILocation(line: 57, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !27, file: !14, line: 57, column: 9)
!41 = !DILocation(line: 57, column: 14, scope: !40)
!42 = !DILocation(line: 57, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !14, line: 57, column: 9)
!44 = !DILocation(line: 57, column: 23, scope: !43)
!45 = !DILocation(line: 57, column: 9, scope: !40)
!46 = !DILocation(line: 59, column: 13, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !14, line: 58, column: 9)
!48 = !DILocation(line: 59, column: 20, scope: !47)
!49 = !DILocation(line: 59, column: 23, scope: !47)
!50 = !DILocation(line: 60, column: 9, scope: !47)
!51 = !DILocation(line: 57, column: 30, scope: !43)
!52 = !DILocation(line: 57, column: 9, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 60, column: 9, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 63, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !27, file: !14, line: 63, column: 13)
!58 = !DILocation(line: 63, column: 18, scope: !57)
!59 = !DILocation(line: 63, column: 13, scope: !27)
!60 = !DILocation(line: 65, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !14, line: 64, column: 9)
!62 = !DILocation(line: 65, column: 20, scope: !61)
!63 = !DILocation(line: 65, column: 26, scope: !61)
!64 = !DILocation(line: 67, column: 19, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !14, line: 67, column: 13)
!66 = !DILocation(line: 67, column: 17, scope: !65)
!67 = !DILocation(line: 67, column: 24, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !14, line: 67, column: 13)
!69 = !DILocation(line: 67, column: 26, scope: !68)
!70 = !DILocation(line: 67, column: 13, scope: !65)
!71 = !DILocation(line: 69, column: 30, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !14, line: 68, column: 13)
!73 = !DILocation(line: 69, column: 37, scope: !72)
!74 = !DILocation(line: 69, column: 17, scope: !72)
!75 = !DILocation(line: 70, column: 13, scope: !72)
!76 = !DILocation(line: 67, column: 33, scope: !68)
!77 = !DILocation(line: 67, column: 13, scope: !68)
!78 = distinct !{!78, !70, !79, !55}
!79 = !DILocation(line: 70, column: 13, scope: !65)
!80 = !DILocation(line: 71, column: 9, scope: !61)
!81 = !DILocation(line: 74, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !57, file: !14, line: 73, column: 9)
!83 = !DILocation(line: 76, column: 14, scope: !27)
!84 = !DILocation(line: 76, column: 9, scope: !27)
!85 = !DILocation(line: 78, column: 1, scope: !13)
!86 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67b_goodG2BSink", scope: !14, file: !14, line: 85, type: !15, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "myStruct", arg: 1, scope: !86, file: !14, line: 85, type: !17)
!88 = !DILocation(line: 85, column: 152, scope: !86)
!89 = !DILocalVariable(name: "data", scope: !86, file: !14, line: 87, type: !5)
!90 = !DILocation(line: 87, column: 9, scope: !86)
!91 = !DILocation(line: 87, column: 25, scope: !86)
!92 = !DILocalVariable(name: "i", scope: !93, file: !14, line: 89, type: !5)
!93 = distinct !DILexicalBlock(scope: !86, file: !14, line: 88, column: 5)
!94 = !DILocation(line: 89, column: 13, scope: !93)
!95 = !DILocalVariable(name: "buffer", scope: !93, file: !14, line: 90, type: !4)
!96 = !DILocation(line: 90, column: 15, scope: !93)
!97 = !DILocation(line: 90, column: 31, scope: !93)
!98 = !DILocation(line: 90, column: 24, scope: !93)
!99 = !DILocation(line: 91, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !14, line: 91, column: 13)
!101 = !DILocation(line: 91, column: 20, scope: !100)
!102 = !DILocation(line: 91, column: 13, scope: !93)
!103 = !DILocation(line: 91, column: 30, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !14, line: 91, column: 29)
!105 = !DILocation(line: 93, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !93, file: !14, line: 93, column: 9)
!107 = !DILocation(line: 93, column: 14, scope: !106)
!108 = !DILocation(line: 93, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !14, line: 93, column: 9)
!110 = !DILocation(line: 93, column: 23, scope: !109)
!111 = !DILocation(line: 93, column: 9, scope: !106)
!112 = !DILocation(line: 95, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !14, line: 94, column: 9)
!114 = !DILocation(line: 95, column: 20, scope: !113)
!115 = !DILocation(line: 95, column: 23, scope: !113)
!116 = !DILocation(line: 96, column: 9, scope: !113)
!117 = !DILocation(line: 93, column: 30, scope: !109)
!118 = !DILocation(line: 93, column: 9, scope: !109)
!119 = distinct !{!119, !111, !120, !55}
!120 = !DILocation(line: 96, column: 9, scope: !106)
!121 = !DILocation(line: 99, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !93, file: !14, line: 99, column: 13)
!123 = !DILocation(line: 99, column: 18, scope: !122)
!124 = !DILocation(line: 99, column: 13, scope: !93)
!125 = !DILocation(line: 101, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !14, line: 100, column: 9)
!127 = !DILocation(line: 101, column: 20, scope: !126)
!128 = !DILocation(line: 101, column: 26, scope: !126)
!129 = !DILocation(line: 103, column: 19, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !14, line: 103, column: 13)
!131 = !DILocation(line: 103, column: 17, scope: !130)
!132 = !DILocation(line: 103, column: 24, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !14, line: 103, column: 13)
!134 = !DILocation(line: 103, column: 26, scope: !133)
!135 = !DILocation(line: 103, column: 13, scope: !130)
!136 = !DILocation(line: 105, column: 30, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !14, line: 104, column: 13)
!138 = !DILocation(line: 105, column: 37, scope: !137)
!139 = !DILocation(line: 105, column: 17, scope: !137)
!140 = !DILocation(line: 106, column: 13, scope: !137)
!141 = !DILocation(line: 103, column: 33, scope: !133)
!142 = !DILocation(line: 103, column: 13, scope: !133)
!143 = distinct !{!143, !135, !144, !55}
!144 = !DILocation(line: 106, column: 13, scope: !130)
!145 = !DILocation(line: 107, column: 9, scope: !126)
!146 = !DILocation(line: 110, column: 13, scope: !147)
!147 = distinct !DILexicalBlock(scope: !122, file: !14, line: 109, column: 9)
!148 = !DILocation(line: 112, column: 14, scope: !93)
!149 = !DILocation(line: 112, column: 9, scope: !93)
!150 = !DILocation(line: 114, column: 1, scope: !86)
!151 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_67b_goodB2GSink", scope: !14, file: !14, line: 117, type: !15, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "myStruct", arg: 1, scope: !151, file: !14, line: 117, type: !17)
!153 = !DILocation(line: 117, column: 152, scope: !151)
!154 = !DILocalVariable(name: "data", scope: !151, file: !14, line: 119, type: !5)
!155 = !DILocation(line: 119, column: 9, scope: !151)
!156 = !DILocation(line: 119, column: 25, scope: !151)
!157 = !DILocalVariable(name: "i", scope: !158, file: !14, line: 121, type: !5)
!158 = distinct !DILexicalBlock(scope: !151, file: !14, line: 120, column: 5)
!159 = !DILocation(line: 121, column: 13, scope: !158)
!160 = !DILocalVariable(name: "buffer", scope: !158, file: !14, line: 122, type: !4)
!161 = !DILocation(line: 122, column: 15, scope: !158)
!162 = !DILocation(line: 122, column: 31, scope: !158)
!163 = !DILocation(line: 122, column: 24, scope: !158)
!164 = !DILocation(line: 123, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !14, line: 123, column: 13)
!166 = !DILocation(line: 123, column: 20, scope: !165)
!167 = !DILocation(line: 123, column: 13, scope: !158)
!168 = !DILocation(line: 123, column: 30, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !14, line: 123, column: 29)
!170 = !DILocation(line: 125, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !158, file: !14, line: 125, column: 9)
!172 = !DILocation(line: 125, column: 14, scope: !171)
!173 = !DILocation(line: 125, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !14, line: 125, column: 9)
!175 = !DILocation(line: 125, column: 23, scope: !174)
!176 = !DILocation(line: 125, column: 9, scope: !171)
!177 = !DILocation(line: 127, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !14, line: 126, column: 9)
!179 = !DILocation(line: 127, column: 20, scope: !178)
!180 = !DILocation(line: 127, column: 23, scope: !178)
!181 = !DILocation(line: 128, column: 9, scope: !178)
!182 = !DILocation(line: 125, column: 30, scope: !174)
!183 = !DILocation(line: 125, column: 9, scope: !174)
!184 = distinct !{!184, !176, !185, !55}
!185 = !DILocation(line: 128, column: 9, scope: !171)
!186 = !DILocation(line: 130, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !158, file: !14, line: 130, column: 13)
!188 = !DILocation(line: 130, column: 18, scope: !187)
!189 = !DILocation(line: 130, column: 23, scope: !187)
!190 = !DILocation(line: 130, column: 26, scope: !187)
!191 = !DILocation(line: 130, column: 31, scope: !187)
!192 = !DILocation(line: 130, column: 13, scope: !158)
!193 = !DILocation(line: 132, column: 13, scope: !194)
!194 = distinct !DILexicalBlock(scope: !187, file: !14, line: 131, column: 9)
!195 = !DILocation(line: 132, column: 20, scope: !194)
!196 = !DILocation(line: 132, column: 26, scope: !194)
!197 = !DILocation(line: 134, column: 19, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !14, line: 134, column: 13)
!199 = !DILocation(line: 134, column: 17, scope: !198)
!200 = !DILocation(line: 134, column: 24, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !14, line: 134, column: 13)
!202 = !DILocation(line: 134, column: 26, scope: !201)
!203 = !DILocation(line: 134, column: 13, scope: !198)
!204 = !DILocation(line: 136, column: 30, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !14, line: 135, column: 13)
!206 = !DILocation(line: 136, column: 37, scope: !205)
!207 = !DILocation(line: 136, column: 17, scope: !205)
!208 = !DILocation(line: 137, column: 13, scope: !205)
!209 = !DILocation(line: 134, column: 33, scope: !201)
!210 = !DILocation(line: 134, column: 13, scope: !201)
!211 = distinct !{!211, !203, !212, !55}
!212 = !DILocation(line: 137, column: 13, scope: !198)
!213 = !DILocation(line: 138, column: 9, scope: !194)
!214 = !DILocation(line: 141, column: 13, scope: !215)
!215 = distinct !DILexicalBlock(scope: !187, file: !14, line: 140, column: 9)
!216 = !DILocation(line: 143, column: 14, scope: !158)
!217 = !DILocation(line: 143, column: 9, scope: !158)
!218 = !DILocation(line: 145, column: 1, scope: !151)
