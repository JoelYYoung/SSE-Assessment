; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_13_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !29
  br label %if.end, !dbg !31

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !32
  %cmp1 = icmp eq i32 %1, 5, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !35

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !36, metadata !DIExpression()), !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  %call = call i64 @strlen(i8* %2) #5, !dbg !43
  store i64 %call, i64* %dataLen, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !44, metadata !DIExpression()), !dbg !45
  %3 = load i64, i64* %dataLen, align 8, !dbg !46
  %add = add i64 %3, 1, !dbg !46
  %mul = mul i64 %add, 4, !dbg !46
  %4 = alloca i8, i64 %mul, align 16, !dbg !46
  store i8* %4, i8** %dest, align 8, !dbg !45
  %5 = load i8*, i8** %dest, align 8, !dbg !47
  %6 = bitcast i8* %5 to i32*, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  %8 = bitcast i8* %7 to i32*, !dbg !48
  %call3 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !49
  %9 = load i8*, i8** %dest, align 8, !dbg !50
  call void @printLine(i8* %9), !dbg !51
  br label %if.end4, !dbg !52

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_13_good() #0 !dbg !54 {
entry:
  call void @goodB2G1(), !dbg !55
  call void @goodB2G2(), !dbg !56
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_13_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_13_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i8* null, i8** %data, align 8, !dbg !81
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !82
  %cmp = icmp eq i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !86
  br label %if.end, !dbg !88

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !89
  %cmp1 = icmp ne i32 %1, 5, !dbg !91
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !92

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  br label %if.end4, !dbg !95

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !96, metadata !DIExpression()), !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %3 = bitcast i8* %2 to i32*, !dbg !101
  %call = call i64 @wcslen(i32* %3) #5, !dbg !102
  store i64 %call, i64* %dataLen, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %4 = load i64, i64* %dataLen, align 8, !dbg !105
  %add = add i64 %4, 1, !dbg !105
  %mul = mul i64 %add, 4, !dbg !105
  %5 = alloca i8, i64 %mul, align 16, !dbg !105
  store i8* %5, i8** %dest, align 8, !dbg !104
  %6 = load i8*, i8** %dest, align 8, !dbg !106
  %7 = bitcast i8* %6 to i32*, !dbg !106
  %8 = load i8*, i8** %data, align 8, !dbg !107
  %9 = bitcast i8* %8 to i32*, !dbg !107
  %call3 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !108
  %10 = load i8*, i8** %dest, align 8, !dbg !109
  %11 = bitcast i8* %10 to i32*, !dbg !110
  call void @printWLine(i32* %11), !dbg !111
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  ret void, !dbg !112
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i8* null, i8** %data, align 8, !dbg !116
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !117
  %cmp = icmp eq i32 %0, 5, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !121
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !124
  %cmp1 = icmp eq i32 %1, 5, !dbg !126
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !127

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !128, metadata !DIExpression()), !dbg !131
  %2 = load i8*, i8** %data, align 8, !dbg !132
  %3 = bitcast i8* %2 to i32*, !dbg !133
  %call = call i64 @wcslen(i32* %3) #5, !dbg !134
  store i64 %call, i64* %dataLen, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !135, metadata !DIExpression()), !dbg !136
  %4 = load i64, i64* %dataLen, align 8, !dbg !137
  %add = add i64 %4, 1, !dbg !137
  %mul = mul i64 %add, 4, !dbg !137
  %5 = alloca i8, i64 %mul, align 16, !dbg !137
  store i8* %5, i8** %dest, align 8, !dbg !136
  %6 = load i8*, i8** %dest, align 8, !dbg !138
  %7 = bitcast i8* %6 to i32*, !dbg !138
  %8 = load i8*, i8** %data, align 8, !dbg !139
  %9 = bitcast i8* %8 to i32*, !dbg !139
  %call3 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !140
  %10 = load i8*, i8** %dest, align 8, !dbg !141
  %11 = bitcast i8* %10 to i32*, !dbg !142
  call void @printWLine(i32* %11), !dbg !143
  br label %if.end4, !dbg !144

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !146 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !147, metadata !DIExpression()), !dbg !148
  store i8* null, i8** %data, align 8, !dbg !149
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !150
  %cmp = icmp ne i32 %0, 5, !dbg !152
  br i1 %cmp, label %if.then, label %if.else, !dbg !153

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !154
  br label %if.end, !dbg !156

if.else:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !157
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !159
  %cmp1 = icmp eq i32 %1, 5, !dbg !161
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !162

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !163, metadata !DIExpression()), !dbg !166
  %2 = load i8*, i8** %data, align 8, !dbg !167
  %call = call i64 @strlen(i8* %2) #5, !dbg !168
  store i64 %call, i64* %dataLen, align 8, !dbg !166
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !169, metadata !DIExpression()), !dbg !170
  %3 = load i64, i64* %dataLen, align 8, !dbg !171
  %add = add i64 %3, 1, !dbg !171
  %mul = mul i64 %add, 1, !dbg !171
  %4 = alloca i8, i64 %mul, align 16, !dbg !171
  store i8* %4, i8** %dest, align 8, !dbg !170
  %5 = load i8*, i8** %dest, align 8, !dbg !172
  %6 = load i8*, i8** %data, align 8, !dbg !173
  %call3 = call i8* @strcpy(i8* %5, i8* %6) #6, !dbg !174
  %7 = load i8*, i8** %dest, align 8, !dbg !175
  call void @printLine(i8* %7), !dbg !176
  br label %if.end4, !dbg !177

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !178
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !179 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !180, metadata !DIExpression()), !dbg !181
  store i8* null, i8** %data, align 8, !dbg !182
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !183
  %cmp = icmp eq i32 %0, 5, !dbg !185
  br i1 %cmp, label %if.then, label %if.end, !dbg !186

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !187
  br label %if.end, !dbg !189

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !190
  %cmp1 = icmp eq i32 %1, 5, !dbg !192
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !193

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !194, metadata !DIExpression()), !dbg !197
  %2 = load i8*, i8** %data, align 8, !dbg !198
  %call = call i64 @strlen(i8* %2) #5, !dbg !199
  store i64 %call, i64* %dataLen, align 8, !dbg !197
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !200, metadata !DIExpression()), !dbg !201
  %3 = load i64, i64* %dataLen, align 8, !dbg !202
  %add = add i64 %3, 1, !dbg !202
  %mul = mul i64 %add, 1, !dbg !202
  %4 = alloca i8, i64 %mul, align 16, !dbg !202
  store i8* %4, i8** %dest, align 8, !dbg !201
  %5 = load i8*, i8** %dest, align 8, !dbg !203
  %6 = load i8*, i8** %data, align 8, !dbg !204
  %call3 = call i8* @strcpy(i8* %5, i8* %6) #6, !dbg !205
  %7 = load i8*, i8** %dest, align 8, !dbg !206
  call void @printLine(i8* %7), !dbg !207
  br label %if.end4, !dbg !208

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !209
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_13_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_13.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocation(line: 30, column: 10, scope: !18)
!25 = !DILocation(line: 31, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 8)
!27 = !DILocation(line: 31, column: 25, scope: !26)
!28 = !DILocation(line: 31, column: 8, scope: !18)
!29 = !DILocation(line: 34, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !19, line: 32, column: 5)
!31 = !DILocation(line: 35, column: 5, scope: !30)
!32 = !DILocation(line: 36, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !19, line: 36, column: 8)
!34 = !DILocation(line: 36, column: 25, scope: !33)
!35 = !DILocation(line: 36, column: 8, scope: !18)
!36 = !DILocalVariable(name: "dataLen", scope: !37, file: !19, line: 40, type: !39)
!37 = distinct !DILexicalBlock(scope: !38, file: !19, line: 38, column: 9)
!38 = distinct !DILexicalBlock(scope: !33, file: !19, line: 37, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 40, column: 20, scope: !37)
!42 = !DILocation(line: 40, column: 45, scope: !37)
!43 = !DILocation(line: 40, column: 30, scope: !37)
!44 = !DILocalVariable(name: "dest", scope: !37, file: !19, line: 41, type: !4)
!45 = !DILocation(line: 41, column: 20, scope: !37)
!46 = !DILocation(line: 41, column: 35, scope: !37)
!47 = !DILocation(line: 42, column: 26, scope: !37)
!48 = !DILocation(line: 42, column: 32, scope: !37)
!49 = !DILocation(line: 42, column: 19, scope: !37)
!50 = !DILocation(line: 43, column: 31, scope: !37)
!51 = !DILocation(line: 43, column: 13, scope: !37)
!52 = !DILocation(line: 45, column: 5, scope: !38)
!53 = !DILocation(line: 46, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_13_good", scope: !19, file: !19, line: 150, type: !20, scopeLine: 151, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 152, column: 5, scope: !54)
!56 = !DILocation(line: 153, column: 5, scope: !54)
!57 = !DILocation(line: 154, column: 5, scope: !54)
!58 = !DILocation(line: 155, column: 5, scope: !54)
!59 = !DILocation(line: 156, column: 1, scope: !54)
!60 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 167, type: !61, scopeLine: 168, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!11, !11, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !19, line: 167, type: !11)
!65 = !DILocation(line: 167, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !19, line: 167, type: !63)
!67 = !DILocation(line: 167, column: 27, scope: !60)
!68 = !DILocation(line: 170, column: 22, scope: !60)
!69 = !DILocation(line: 170, column: 12, scope: !60)
!70 = !DILocation(line: 170, column: 5, scope: !60)
!71 = !DILocation(line: 172, column: 5, scope: !60)
!72 = !DILocation(line: 173, column: 5, scope: !60)
!73 = !DILocation(line: 174, column: 5, scope: !60)
!74 = !DILocation(line: 177, column: 5, scope: !60)
!75 = !DILocation(line: 178, column: 5, scope: !60)
!76 = !DILocation(line: 179, column: 5, scope: !60)
!77 = !DILocation(line: 181, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodB2G1", scope: !19, file: !19, line: 53, type: !20, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !19, line: 55, type: !4)
!80 = !DILocation(line: 55, column: 12, scope: !78)
!81 = !DILocation(line: 56, column: 10, scope: !78)
!82 = !DILocation(line: 57, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !19, line: 57, column: 8)
!84 = !DILocation(line: 57, column: 25, scope: !83)
!85 = !DILocation(line: 57, column: 8, scope: !78)
!86 = !DILocation(line: 60, column: 14, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !19, line: 58, column: 5)
!88 = !DILocation(line: 61, column: 5, scope: !87)
!89 = !DILocation(line: 62, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !19, line: 62, column: 8)
!91 = !DILocation(line: 62, column: 25, scope: !90)
!92 = !DILocation(line: 62, column: 8, scope: !78)
!93 = !DILocation(line: 65, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !19, line: 63, column: 5)
!95 = !DILocation(line: 66, column: 5, scope: !94)
!96 = !DILocalVariable(name: "dataLen", scope: !97, file: !19, line: 71, type: !39)
!97 = distinct !DILexicalBlock(scope: !98, file: !19, line: 69, column: 9)
!98 = distinct !DILexicalBlock(scope: !90, file: !19, line: 68, column: 5)
!99 = !DILocation(line: 71, column: 20, scope: !97)
!100 = !DILocation(line: 71, column: 48, scope: !97)
!101 = !DILocation(line: 71, column: 37, scope: !97)
!102 = !DILocation(line: 71, column: 30, scope: !97)
!103 = !DILocalVariable(name: "dest", scope: !97, file: !19, line: 72, type: !4)
!104 = !DILocation(line: 72, column: 20, scope: !97)
!105 = !DILocation(line: 72, column: 35, scope: !97)
!106 = !DILocation(line: 73, column: 26, scope: !97)
!107 = !DILocation(line: 73, column: 32, scope: !97)
!108 = !DILocation(line: 73, column: 19, scope: !97)
!109 = !DILocation(line: 74, column: 35, scope: !97)
!110 = !DILocation(line: 74, column: 24, scope: !97)
!111 = !DILocation(line: 74, column: 13, scope: !97)
!112 = !DILocation(line: 77, column: 1, scope: !78)
!113 = distinct !DISubprogram(name: "goodB2G2", scope: !19, file: !19, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !19, line: 82, type: !4)
!115 = !DILocation(line: 82, column: 12, scope: !113)
!116 = !DILocation(line: 83, column: 10, scope: !113)
!117 = !DILocation(line: 84, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !19, line: 84, column: 8)
!119 = !DILocation(line: 84, column: 25, scope: !118)
!120 = !DILocation(line: 84, column: 8, scope: !113)
!121 = !DILocation(line: 87, column: 14, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !19, line: 85, column: 5)
!123 = !DILocation(line: 88, column: 5, scope: !122)
!124 = !DILocation(line: 89, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !113, file: !19, line: 89, column: 8)
!126 = !DILocation(line: 89, column: 25, scope: !125)
!127 = !DILocation(line: 89, column: 8, scope: !113)
!128 = !DILocalVariable(name: "dataLen", scope: !129, file: !19, line: 93, type: !39)
!129 = distinct !DILexicalBlock(scope: !130, file: !19, line: 91, column: 9)
!130 = distinct !DILexicalBlock(scope: !125, file: !19, line: 90, column: 5)
!131 = !DILocation(line: 93, column: 20, scope: !129)
!132 = !DILocation(line: 93, column: 48, scope: !129)
!133 = !DILocation(line: 93, column: 37, scope: !129)
!134 = !DILocation(line: 93, column: 30, scope: !129)
!135 = !DILocalVariable(name: "dest", scope: !129, file: !19, line: 94, type: !4)
!136 = !DILocation(line: 94, column: 20, scope: !129)
!137 = !DILocation(line: 94, column: 35, scope: !129)
!138 = !DILocation(line: 95, column: 26, scope: !129)
!139 = !DILocation(line: 95, column: 32, scope: !129)
!140 = !DILocation(line: 95, column: 19, scope: !129)
!141 = !DILocation(line: 96, column: 35, scope: !129)
!142 = !DILocation(line: 96, column: 24, scope: !129)
!143 = !DILocation(line: 96, column: 13, scope: !129)
!144 = !DILocation(line: 98, column: 5, scope: !130)
!145 = !DILocation(line: 99, column: 1, scope: !113)
!146 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 102, type: !20, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", scope: !146, file: !19, line: 104, type: !4)
!148 = !DILocation(line: 104, column: 12, scope: !146)
!149 = !DILocation(line: 105, column: 10, scope: !146)
!150 = !DILocation(line: 106, column: 8, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !19, line: 106, column: 8)
!152 = !DILocation(line: 106, column: 25, scope: !151)
!153 = !DILocation(line: 106, column: 8, scope: !146)
!154 = !DILocation(line: 109, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !19, line: 107, column: 5)
!156 = !DILocation(line: 110, column: 5, scope: !155)
!157 = !DILocation(line: 114, column: 14, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !19, line: 112, column: 5)
!159 = !DILocation(line: 116, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !146, file: !19, line: 116, column: 8)
!161 = !DILocation(line: 116, column: 25, scope: !160)
!162 = !DILocation(line: 116, column: 8, scope: !146)
!163 = !DILocalVariable(name: "dataLen", scope: !164, file: !19, line: 120, type: !39)
!164 = distinct !DILexicalBlock(scope: !165, file: !19, line: 118, column: 9)
!165 = distinct !DILexicalBlock(scope: !160, file: !19, line: 117, column: 5)
!166 = !DILocation(line: 120, column: 20, scope: !164)
!167 = !DILocation(line: 120, column: 45, scope: !164)
!168 = !DILocation(line: 120, column: 30, scope: !164)
!169 = !DILocalVariable(name: "dest", scope: !164, file: !19, line: 121, type: !4)
!170 = !DILocation(line: 121, column: 20, scope: !164)
!171 = !DILocation(line: 121, column: 35, scope: !164)
!172 = !DILocation(line: 122, column: 26, scope: !164)
!173 = !DILocation(line: 122, column: 32, scope: !164)
!174 = !DILocation(line: 122, column: 19, scope: !164)
!175 = !DILocation(line: 123, column: 31, scope: !164)
!176 = !DILocation(line: 123, column: 13, scope: !164)
!177 = !DILocation(line: 125, column: 5, scope: !165)
!178 = !DILocation(line: 126, column: 1, scope: !146)
!179 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 129, type: !20, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!180 = !DILocalVariable(name: "data", scope: !179, file: !19, line: 131, type: !4)
!181 = !DILocation(line: 131, column: 12, scope: !179)
!182 = !DILocation(line: 132, column: 10, scope: !179)
!183 = !DILocation(line: 133, column: 8, scope: !184)
!184 = distinct !DILexicalBlock(scope: !179, file: !19, line: 133, column: 8)
!185 = !DILocation(line: 133, column: 25, scope: !184)
!186 = !DILocation(line: 133, column: 8, scope: !179)
!187 = !DILocation(line: 136, column: 14, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !19, line: 134, column: 5)
!189 = !DILocation(line: 137, column: 5, scope: !188)
!190 = !DILocation(line: 138, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !179, file: !19, line: 138, column: 8)
!192 = !DILocation(line: 138, column: 25, scope: !191)
!193 = !DILocation(line: 138, column: 8, scope: !179)
!194 = !DILocalVariable(name: "dataLen", scope: !195, file: !19, line: 142, type: !39)
!195 = distinct !DILexicalBlock(scope: !196, file: !19, line: 140, column: 9)
!196 = distinct !DILexicalBlock(scope: !191, file: !19, line: 139, column: 5)
!197 = !DILocation(line: 142, column: 20, scope: !195)
!198 = !DILocation(line: 142, column: 45, scope: !195)
!199 = !DILocation(line: 142, column: 30, scope: !195)
!200 = !DILocalVariable(name: "dest", scope: !195, file: !19, line: 143, type: !4)
!201 = !DILocation(line: 143, column: 20, scope: !195)
!202 = !DILocation(line: 143, column: 35, scope: !195)
!203 = !DILocation(line: 144, column: 26, scope: !195)
!204 = !DILocation(line: 144, column: 32, scope: !195)
!205 = !DILocation(line: 144, column: 19, scope: !195)
!206 = !DILocation(line: 145, column: 31, scope: !195)
!207 = !DILocation(line: 145, column: 13, scope: !195)
!208 = !DILocation(line: 147, column: 5, scope: !196)
!209 = !DILocation(line: 148, column: 1, scope: !179)
