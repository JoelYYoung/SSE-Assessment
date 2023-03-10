; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataPtr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataPtr, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = load i32*, i32** %dataPtr, align 8, !dbg !25
  %3 = load i32, i32* %2, align 4, !dbg !26
  store i32 %3, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !30, metadata !DIExpression()), !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !32
  %4 = bitcast i8* %call to i32*, !dbg !33
  store i32* %4, i32** %buffer, align 8, !dbg !31
  %5 = load i32*, i32** %buffer, align 8, !dbg !34
  %cmp = icmp eq i32* %5, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i32, i32* %i, align 4, !dbg !43
  %cmp1 = icmp slt i32 %6, 10, !dbg !45
  br i1 %cmp1, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !47
  %8 = load i32, i32* %i, align 4, !dbg !49
  %idxprom = sext i32 %8 to i64, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %9, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !57
  %cmp2 = icmp sge i32 %10, 0, !dbg !59
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !60

if.then3:                                         ; preds = %for.end
  %11 = load i32*, i32** %buffer, align 8, !dbg !61
  %12 = load i32, i32* %data, align 4, !dbg !63
  %idxprom4 = sext i32 %12 to i64, !dbg !61
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 %idxprom4, !dbg !61
  store i32 1, i32* %arrayidx5, align 4, !dbg !64
  store i32 0, i32* %i, align 4, !dbg !65
  br label %for.cond6, !dbg !67

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %13 = load i32, i32* %i, align 4, !dbg !68
  %cmp7 = icmp slt i32 %13, 10, !dbg !70
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !71

for.body8:                                        ; preds = %for.cond6
  %14 = load i32*, i32** %buffer, align 8, !dbg !72
  %15 = load i32, i32* %i, align 4, !dbg !74
  %idxprom9 = sext i32 %15 to i64, !dbg !72
  %arrayidx10 = getelementptr inbounds i32, i32* %14, i64 %idxprom9, !dbg !72
  %16 = load i32, i32* %arrayidx10, align 4, !dbg !72
  call void @printIntLine(i32 %16), !dbg !75
  br label %for.inc11, !dbg !76

for.inc11:                                        ; preds = %for.body8
  %17 = load i32, i32* %i, align 4, !dbg !77
  %inc12 = add nsw i32 %17, 1, !dbg !77
  store i32 %inc12, i32* %i, align 4, !dbg !77
  br label %for.cond6, !dbg !78, !llvm.loop !79

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !81

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !82
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %18 = load i32*, i32** %buffer, align 8, !dbg !84
  %19 = bitcast i32* %18 to i8*, !dbg !84
  call void @free(i8* %19) #5, !dbg !85
  ret void, !dbg !86
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !87 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataPtr, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !92
  %1 = bitcast i8* %0 to i32*, !dbg !93
  store i32* %1, i32** %dataPtr, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32* %data, metadata !94, metadata !DIExpression()), !dbg !95
  %2 = load i32*, i32** %dataPtr, align 8, !dbg !96
  %3 = load i32, i32* %2, align 4, !dbg !97
  store i32 %3, i32* %data, align 4, !dbg !95
  call void @llvm.dbg.declare(metadata i32* %i, metadata !98, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !103
  %4 = bitcast i8* %call to i32*, !dbg !104
  store i32* %4, i32** %buffer, align 8, !dbg !102
  %5 = load i32*, i32** %buffer, align 8, !dbg !105
  %cmp = icmp eq i32* %5, null, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !109
  unreachable, !dbg !109

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i32, i32* %i, align 4, !dbg !114
  %cmp1 = icmp slt i32 %6, 10, !dbg !116
  br i1 %cmp1, label %for.body, label %for.end, !dbg !117

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !118
  %8 = load i32, i32* %i, align 4, !dbg !120
  %idxprom = sext i32 %8 to i64, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !123
  %inc = add nsw i32 %9, 1, !dbg !123
  store i32 %inc, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !127
  %cmp2 = icmp sge i32 %10, 0, !dbg !129
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !130

if.then3:                                         ; preds = %for.end
  %11 = load i32*, i32** %buffer, align 8, !dbg !131
  %12 = load i32, i32* %data, align 4, !dbg !133
  %idxprom4 = sext i32 %12 to i64, !dbg !131
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 %idxprom4, !dbg !131
  store i32 1, i32* %arrayidx5, align 4, !dbg !134
  store i32 0, i32* %i, align 4, !dbg !135
  br label %for.cond6, !dbg !137

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %13 = load i32, i32* %i, align 4, !dbg !138
  %cmp7 = icmp slt i32 %13, 10, !dbg !140
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !141

for.body8:                                        ; preds = %for.cond6
  %14 = load i32*, i32** %buffer, align 8, !dbg !142
  %15 = load i32, i32* %i, align 4, !dbg !144
  %idxprom9 = sext i32 %15 to i64, !dbg !142
  %arrayidx10 = getelementptr inbounds i32, i32* %14, i64 %idxprom9, !dbg !142
  %16 = load i32, i32* %arrayidx10, align 4, !dbg !142
  call void @printIntLine(i32 %16), !dbg !145
  br label %for.inc11, !dbg !146

for.inc11:                                        ; preds = %for.body8
  %17 = load i32, i32* %i, align 4, !dbg !147
  %inc12 = add nsw i32 %17, 1, !dbg !147
  store i32 %inc12, i32* %i, align 4, !dbg !147
  br label %for.cond6, !dbg !148, !llvm.loop !149

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !151

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !152
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %18 = load i32*, i32** %buffer, align 8, !dbg !154
  %19 = bitcast i32* %18 to i8*, !dbg !154
  call void @free(i8* %19) #5, !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_64b_goodB2GSink(i8* %dataVoidPtr) #0 !dbg !157 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i32** %dataPtr, metadata !160, metadata !DIExpression()), !dbg !161
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !162
  %1 = bitcast i8* %0 to i32*, !dbg !163
  store i32* %1, i32** %dataPtr, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata i32* %data, metadata !164, metadata !DIExpression()), !dbg !165
  %2 = load i32*, i32** %dataPtr, align 8, !dbg !166
  %3 = load i32, i32* %2, align 4, !dbg !167
  store i32 %3, i32* %data, align 4, !dbg !165
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !171, metadata !DIExpression()), !dbg !172
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !173
  %4 = bitcast i8* %call to i32*, !dbg !174
  store i32* %4, i32** %buffer, align 8, !dbg !172
  %5 = load i32*, i32** %buffer, align 8, !dbg !175
  %cmp = icmp eq i32* %5, null, !dbg !177
  br i1 %cmp, label %if.then, label %if.end, !dbg !178

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !179
  unreachable, !dbg !179

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i32, i32* %i, align 4, !dbg !184
  %cmp1 = icmp slt i32 %6, 10, !dbg !186
  br i1 %cmp1, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !188
  %8 = load i32, i32* %i, align 4, !dbg !190
  %idxprom = sext i32 %8 to i64, !dbg !188
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !188
  store i32 0, i32* %arrayidx, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !193
  %inc = add nsw i32 %9, 1, !dbg !193
  store i32 %inc, i32* %i, align 4, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !197
  %cmp2 = icmp sge i32 %10, 0, !dbg !199
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !200

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data, align 4, !dbg !201
  %cmp3 = icmp slt i32 %11, 10, !dbg !202
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !203

if.then4:                                         ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !204
  %13 = load i32, i32* %data, align 4, !dbg !206
  %idxprom5 = sext i32 %13 to i64, !dbg !204
  %arrayidx6 = getelementptr inbounds i32, i32* %12, i64 %idxprom5, !dbg !204
  store i32 1, i32* %arrayidx6, align 4, !dbg !207
  store i32 0, i32* %i, align 4, !dbg !208
  br label %for.cond7, !dbg !210

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %14 = load i32, i32* %i, align 4, !dbg !211
  %cmp8 = icmp slt i32 %14, 10, !dbg !213
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !214

for.body9:                                        ; preds = %for.cond7
  %15 = load i32*, i32** %buffer, align 8, !dbg !215
  %16 = load i32, i32* %i, align 4, !dbg !217
  %idxprom10 = sext i32 %16 to i64, !dbg !215
  %arrayidx11 = getelementptr inbounds i32, i32* %15, i64 %idxprom10, !dbg !215
  %17 = load i32, i32* %arrayidx11, align 4, !dbg !215
  call void @printIntLine(i32 %17), !dbg !218
  br label %for.inc12, !dbg !219

for.inc12:                                        ; preds = %for.body9
  %18 = load i32, i32* %i, align 4, !dbg !220
  %inc13 = add nsw i32 %18, 1, !dbg !220
  store i32 %inc13, i32* %i, align 4, !dbg !220
  br label %for.cond7, !dbg !221, !llvm.loop !222

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !224

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !225
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %19 = load i32*, i32** %buffer, align 8, !dbg !227
  %20 = bitcast i32* %19 to i8*, !dbg !227
  call void @free(i8* %20) #5, !dbg !228
  ret void, !dbg !229
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_64b_badSink", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !6}
!17 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 44, type: !6)
!18 = !DILocation(line: 44, column: 84, scope: !13)
!19 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 47, type: !4)
!20 = !DILocation(line: 47, column: 11, scope: !13)
!21 = !DILocation(line: 47, column: 28, scope: !13)
!22 = !DILocation(line: 47, column: 21, scope: !13)
!23 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 49, type: !5)
!24 = !DILocation(line: 49, column: 9, scope: !13)
!25 = !DILocation(line: 49, column: 18, scope: !13)
!26 = !DILocation(line: 49, column: 17, scope: !13)
!27 = !DILocalVariable(name: "i", scope: !28, file: !14, line: 51, type: !5)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 50, column: 5)
!29 = !DILocation(line: 51, column: 13, scope: !28)
!30 = !DILocalVariable(name: "buffer", scope: !28, file: !14, line: 52, type: !4)
!31 = !DILocation(line: 52, column: 15, scope: !28)
!32 = !DILocation(line: 52, column: 31, scope: !28)
!33 = !DILocation(line: 52, column: 24, scope: !28)
!34 = !DILocation(line: 53, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !14, line: 53, column: 13)
!36 = !DILocation(line: 53, column: 20, scope: !35)
!37 = !DILocation(line: 53, column: 13, scope: !28)
!38 = !DILocation(line: 53, column: 30, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !14, line: 53, column: 29)
!40 = !DILocation(line: 55, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !28, file: !14, line: 55, column: 9)
!42 = !DILocation(line: 55, column: 14, scope: !41)
!43 = !DILocation(line: 55, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !14, line: 55, column: 9)
!45 = !DILocation(line: 55, column: 23, scope: !44)
!46 = !DILocation(line: 55, column: 9, scope: !41)
!47 = !DILocation(line: 57, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !14, line: 56, column: 9)
!49 = !DILocation(line: 57, column: 20, scope: !48)
!50 = !DILocation(line: 57, column: 23, scope: !48)
!51 = !DILocation(line: 58, column: 9, scope: !48)
!52 = !DILocation(line: 55, column: 30, scope: !44)
!53 = !DILocation(line: 55, column: 9, scope: !44)
!54 = distinct !{!54, !46, !55, !56}
!55 = !DILocation(line: 58, column: 9, scope: !41)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 61, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !28, file: !14, line: 61, column: 13)
!59 = !DILocation(line: 61, column: 18, scope: !58)
!60 = !DILocation(line: 61, column: 13, scope: !28)
!61 = !DILocation(line: 63, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !14, line: 62, column: 9)
!63 = !DILocation(line: 63, column: 20, scope: !62)
!64 = !DILocation(line: 63, column: 26, scope: !62)
!65 = !DILocation(line: 65, column: 19, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !14, line: 65, column: 13)
!67 = !DILocation(line: 65, column: 17, scope: !66)
!68 = !DILocation(line: 65, column: 24, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !14, line: 65, column: 13)
!70 = !DILocation(line: 65, column: 26, scope: !69)
!71 = !DILocation(line: 65, column: 13, scope: !66)
!72 = !DILocation(line: 67, column: 30, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !14, line: 66, column: 13)
!74 = !DILocation(line: 67, column: 37, scope: !73)
!75 = !DILocation(line: 67, column: 17, scope: !73)
!76 = !DILocation(line: 68, column: 13, scope: !73)
!77 = !DILocation(line: 65, column: 33, scope: !69)
!78 = !DILocation(line: 65, column: 13, scope: !69)
!79 = distinct !{!79, !71, !80, !56}
!80 = !DILocation(line: 68, column: 13, scope: !66)
!81 = !DILocation(line: 69, column: 9, scope: !62)
!82 = !DILocation(line: 72, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !58, file: !14, line: 71, column: 9)
!84 = !DILocation(line: 74, column: 14, scope: !28)
!85 = !DILocation(line: 74, column: 9, scope: !28)
!86 = !DILocation(line: 76, column: 1, scope: !13)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_64b_goodG2BSink", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !87, file: !14, line: 83, type: !6)
!89 = !DILocation(line: 83, column: 88, scope: !87)
!90 = !DILocalVariable(name: "dataPtr", scope: !87, file: !14, line: 86, type: !4)
!91 = !DILocation(line: 86, column: 11, scope: !87)
!92 = !DILocation(line: 86, column: 28, scope: !87)
!93 = !DILocation(line: 86, column: 21, scope: !87)
!94 = !DILocalVariable(name: "data", scope: !87, file: !14, line: 88, type: !5)
!95 = !DILocation(line: 88, column: 9, scope: !87)
!96 = !DILocation(line: 88, column: 18, scope: !87)
!97 = !DILocation(line: 88, column: 17, scope: !87)
!98 = !DILocalVariable(name: "i", scope: !99, file: !14, line: 90, type: !5)
!99 = distinct !DILexicalBlock(scope: !87, file: !14, line: 89, column: 5)
!100 = !DILocation(line: 90, column: 13, scope: !99)
!101 = !DILocalVariable(name: "buffer", scope: !99, file: !14, line: 91, type: !4)
!102 = !DILocation(line: 91, column: 15, scope: !99)
!103 = !DILocation(line: 91, column: 31, scope: !99)
!104 = !DILocation(line: 91, column: 24, scope: !99)
!105 = !DILocation(line: 92, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !99, file: !14, line: 92, column: 13)
!107 = !DILocation(line: 92, column: 20, scope: !106)
!108 = !DILocation(line: 92, column: 13, scope: !99)
!109 = !DILocation(line: 92, column: 30, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !14, line: 92, column: 29)
!111 = !DILocation(line: 94, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !99, file: !14, line: 94, column: 9)
!113 = !DILocation(line: 94, column: 14, scope: !112)
!114 = !DILocation(line: 94, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !14, line: 94, column: 9)
!116 = !DILocation(line: 94, column: 23, scope: !115)
!117 = !DILocation(line: 94, column: 9, scope: !112)
!118 = !DILocation(line: 96, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !14, line: 95, column: 9)
!120 = !DILocation(line: 96, column: 20, scope: !119)
!121 = !DILocation(line: 96, column: 23, scope: !119)
!122 = !DILocation(line: 97, column: 9, scope: !119)
!123 = !DILocation(line: 94, column: 30, scope: !115)
!124 = !DILocation(line: 94, column: 9, scope: !115)
!125 = distinct !{!125, !117, !126, !56}
!126 = !DILocation(line: 97, column: 9, scope: !112)
!127 = !DILocation(line: 100, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !99, file: !14, line: 100, column: 13)
!129 = !DILocation(line: 100, column: 18, scope: !128)
!130 = !DILocation(line: 100, column: 13, scope: !99)
!131 = !DILocation(line: 102, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !14, line: 101, column: 9)
!133 = !DILocation(line: 102, column: 20, scope: !132)
!134 = !DILocation(line: 102, column: 26, scope: !132)
!135 = !DILocation(line: 104, column: 19, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !14, line: 104, column: 13)
!137 = !DILocation(line: 104, column: 17, scope: !136)
!138 = !DILocation(line: 104, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !14, line: 104, column: 13)
!140 = !DILocation(line: 104, column: 26, scope: !139)
!141 = !DILocation(line: 104, column: 13, scope: !136)
!142 = !DILocation(line: 106, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !14, line: 105, column: 13)
!144 = !DILocation(line: 106, column: 37, scope: !143)
!145 = !DILocation(line: 106, column: 17, scope: !143)
!146 = !DILocation(line: 107, column: 13, scope: !143)
!147 = !DILocation(line: 104, column: 33, scope: !139)
!148 = !DILocation(line: 104, column: 13, scope: !139)
!149 = distinct !{!149, !141, !150, !56}
!150 = !DILocation(line: 107, column: 13, scope: !136)
!151 = !DILocation(line: 108, column: 9, scope: !132)
!152 = !DILocation(line: 111, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !128, file: !14, line: 110, column: 9)
!154 = !DILocation(line: 113, column: 14, scope: !99)
!155 = !DILocation(line: 113, column: 9, scope: !99)
!156 = !DILocation(line: 115, column: 1, scope: !87)
!157 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_64b_goodB2GSink", scope: !14, file: !14, line: 118, type: !15, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !157, file: !14, line: 118, type: !6)
!159 = !DILocation(line: 118, column: 88, scope: !157)
!160 = !DILocalVariable(name: "dataPtr", scope: !157, file: !14, line: 121, type: !4)
!161 = !DILocation(line: 121, column: 11, scope: !157)
!162 = !DILocation(line: 121, column: 28, scope: !157)
!163 = !DILocation(line: 121, column: 21, scope: !157)
!164 = !DILocalVariable(name: "data", scope: !157, file: !14, line: 123, type: !5)
!165 = !DILocation(line: 123, column: 9, scope: !157)
!166 = !DILocation(line: 123, column: 18, scope: !157)
!167 = !DILocation(line: 123, column: 17, scope: !157)
!168 = !DILocalVariable(name: "i", scope: !169, file: !14, line: 125, type: !5)
!169 = distinct !DILexicalBlock(scope: !157, file: !14, line: 124, column: 5)
!170 = !DILocation(line: 125, column: 13, scope: !169)
!171 = !DILocalVariable(name: "buffer", scope: !169, file: !14, line: 126, type: !4)
!172 = !DILocation(line: 126, column: 15, scope: !169)
!173 = !DILocation(line: 126, column: 31, scope: !169)
!174 = !DILocation(line: 126, column: 24, scope: !169)
!175 = !DILocation(line: 127, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !169, file: !14, line: 127, column: 13)
!177 = !DILocation(line: 127, column: 20, scope: !176)
!178 = !DILocation(line: 127, column: 13, scope: !169)
!179 = !DILocation(line: 127, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !14, line: 127, column: 29)
!181 = !DILocation(line: 129, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !169, file: !14, line: 129, column: 9)
!183 = !DILocation(line: 129, column: 14, scope: !182)
!184 = !DILocation(line: 129, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !14, line: 129, column: 9)
!186 = !DILocation(line: 129, column: 23, scope: !185)
!187 = !DILocation(line: 129, column: 9, scope: !182)
!188 = !DILocation(line: 131, column: 13, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !14, line: 130, column: 9)
!190 = !DILocation(line: 131, column: 20, scope: !189)
!191 = !DILocation(line: 131, column: 23, scope: !189)
!192 = !DILocation(line: 132, column: 9, scope: !189)
!193 = !DILocation(line: 129, column: 30, scope: !185)
!194 = !DILocation(line: 129, column: 9, scope: !185)
!195 = distinct !{!195, !187, !196, !56}
!196 = !DILocation(line: 132, column: 9, scope: !182)
!197 = !DILocation(line: 134, column: 13, scope: !198)
!198 = distinct !DILexicalBlock(scope: !169, file: !14, line: 134, column: 13)
!199 = !DILocation(line: 134, column: 18, scope: !198)
!200 = !DILocation(line: 134, column: 23, scope: !198)
!201 = !DILocation(line: 134, column: 26, scope: !198)
!202 = !DILocation(line: 134, column: 31, scope: !198)
!203 = !DILocation(line: 134, column: 13, scope: !169)
!204 = !DILocation(line: 136, column: 13, scope: !205)
!205 = distinct !DILexicalBlock(scope: !198, file: !14, line: 135, column: 9)
!206 = !DILocation(line: 136, column: 20, scope: !205)
!207 = !DILocation(line: 136, column: 26, scope: !205)
!208 = !DILocation(line: 138, column: 19, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !14, line: 138, column: 13)
!210 = !DILocation(line: 138, column: 17, scope: !209)
!211 = !DILocation(line: 138, column: 24, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !14, line: 138, column: 13)
!213 = !DILocation(line: 138, column: 26, scope: !212)
!214 = !DILocation(line: 138, column: 13, scope: !209)
!215 = !DILocation(line: 140, column: 30, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !14, line: 139, column: 13)
!217 = !DILocation(line: 140, column: 37, scope: !216)
!218 = !DILocation(line: 140, column: 17, scope: !216)
!219 = !DILocation(line: 141, column: 13, scope: !216)
!220 = !DILocation(line: 138, column: 33, scope: !212)
!221 = !DILocation(line: 138, column: 13, scope: !212)
!222 = distinct !{!222, !214, !223, !56}
!223 = !DILocation(line: 141, column: 13, scope: !209)
!224 = !DILocation(line: 142, column: 9, scope: !205)
!225 = !DILocation(line: 145, column: 13, scope: !226)
!226 = distinct !DILexicalBlock(scope: !198, file: !14, line: 144, column: 9)
!227 = !DILocation(line: 147, column: 14, scope: !169)
!228 = !DILocation(line: 147, column: 9, scope: !169)
!229 = !DILocation(line: 149, column: 1, scope: !157)
