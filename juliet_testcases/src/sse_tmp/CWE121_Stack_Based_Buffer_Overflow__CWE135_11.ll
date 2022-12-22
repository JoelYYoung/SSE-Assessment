; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_11_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !28
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !31
  %tobool2 = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !33

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !34, metadata !DIExpression()), !dbg !39
  %0 = load i8*, i8** %data, align 8, !dbg !40
  %call4 = call i64 @strlen(i8* %0) #5, !dbg !41
  store i64 %call4, i64* %dataLen, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !42, metadata !DIExpression()), !dbg !43
  %1 = load i64, i64* %dataLen, align 8, !dbg !44
  %add = add i64 %1, 1, !dbg !44
  %mul = mul i64 %add, 4, !dbg !44
  %2 = alloca i8, i64 %mul, align 16, !dbg !44
  store i8* %2, i8** %dest, align 8, !dbg !43
  %3 = load i8*, i8** %dest, align 8, !dbg !45
  %4 = bitcast i8* %3 to i32*, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  %6 = bitcast i8* %5 to i32*, !dbg !46
  %call5 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !47
  %7 = load i8*, i8** %dest, align 8, !dbg !48
  call void @printLine(i8* %7), !dbg !49
  br label %if.end6, !dbg !50

if.end6:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_11_good() #0 !dbg !52 {
entry:
  call void @goodB2G1(), !dbg !53
  call void @goodB2G2(), !dbg !54
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_11_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_11_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i8* null, i8** %data, align 8, !dbg !79
  %call = call i32 (...) @globalReturnsTrue(), !dbg !80
  %tobool = icmp ne i32 %call, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !83
  br label %if.end, !dbg !85

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !86
  %tobool2 = icmp ne i32 %call1, 0, !dbg !86
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !88

if.then3:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !89
  br label %if.end6, !dbg !91

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !92, metadata !DIExpression()), !dbg !95
  %0 = load i8*, i8** %data, align 8, !dbg !96
  %1 = bitcast i8* %0 to i32*, !dbg !97
  %call4 = call i64 @wcslen(i32* %1) #5, !dbg !98
  store i64 %call4, i64* %dataLen, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !99, metadata !DIExpression()), !dbg !100
  %2 = load i64, i64* %dataLen, align 8, !dbg !101
  %add = add i64 %2, 1, !dbg !101
  %mul = mul i64 %add, 4, !dbg !101
  %3 = alloca i8, i64 %mul, align 16, !dbg !101
  store i8* %3, i8** %dest, align 8, !dbg !100
  %4 = load i8*, i8** %dest, align 8, !dbg !102
  %5 = bitcast i8* %4 to i32*, !dbg !102
  %6 = load i8*, i8** %data, align 8, !dbg !103
  %7 = bitcast i8* %6 to i32*, !dbg !103
  %call5 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !104
  %8 = load i8*, i8** %dest, align 8, !dbg !105
  %9 = bitcast i8* %8 to i32*, !dbg !106
  call void @printWLine(i32* %9), !dbg !107
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret void, !dbg !108
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i8* null, i8** %data, align 8, !dbg !112
  %call = call i32 (...) @globalReturnsTrue(), !dbg !113
  %tobool = icmp ne i32 %call, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !116
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !119
  %tobool2 = icmp ne i32 %call1, 0, !dbg !119
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !121

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !122, metadata !DIExpression()), !dbg !125
  %0 = load i8*, i8** %data, align 8, !dbg !126
  %1 = bitcast i8* %0 to i32*, !dbg !127
  %call4 = call i64 @wcslen(i32* %1) #5, !dbg !128
  store i64 %call4, i64* %dataLen, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !129, metadata !DIExpression()), !dbg !130
  %2 = load i64, i64* %dataLen, align 8, !dbg !131
  %add = add i64 %2, 1, !dbg !131
  %mul = mul i64 %add, 4, !dbg !131
  %3 = alloca i8, i64 %mul, align 16, !dbg !131
  store i8* %3, i8** %dest, align 8, !dbg !130
  %4 = load i8*, i8** %dest, align 8, !dbg !132
  %5 = bitcast i8* %4 to i32*, !dbg !132
  %6 = load i8*, i8** %data, align 8, !dbg !133
  %7 = bitcast i8* %6 to i32*, !dbg !133
  %call5 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !134
  %8 = load i8*, i8** %dest, align 8, !dbg !135
  %9 = bitcast i8* %8 to i32*, !dbg !136
  call void @printWLine(i32* %9), !dbg !137
  br label %if.end6, !dbg !138

if.end6:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !140 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !141, metadata !DIExpression()), !dbg !142
  store i8* null, i8** %data, align 8, !dbg !143
  %call = call i32 (...) @globalReturnsFalse(), !dbg !144
  %tobool = icmp ne i32 %call, 0, !dbg !144
  br i1 %tobool, label %if.then, label %if.else, !dbg !146

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !147
  br label %if.end, !dbg !149

if.else:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !150
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !152
  %tobool2 = icmp ne i32 %call1, 0, !dbg !152
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !154

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !155, metadata !DIExpression()), !dbg !158
  %0 = load i8*, i8** %data, align 8, !dbg !159
  %call4 = call i64 @strlen(i8* %0) #5, !dbg !160
  store i64 %call4, i64* %dataLen, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !161, metadata !DIExpression()), !dbg !162
  %1 = load i64, i64* %dataLen, align 8, !dbg !163
  %add = add i64 %1, 1, !dbg !163
  %mul = mul i64 %add, 1, !dbg !163
  %2 = alloca i8, i64 %mul, align 16, !dbg !163
  store i8* %2, i8** %dest, align 8, !dbg !162
  %3 = load i8*, i8** %dest, align 8, !dbg !164
  %4 = load i8*, i8** %data, align 8, !dbg !165
  %call5 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !166
  %5 = load i8*, i8** %dest, align 8, !dbg !167
  call void @printLine(i8* %5), !dbg !168
  br label %if.end6, !dbg !169

if.end6:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !170
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !171 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !172, metadata !DIExpression()), !dbg !173
  store i8* null, i8** %data, align 8, !dbg !174
  %call = call i32 (...) @globalReturnsTrue(), !dbg !175
  %tobool = icmp ne i32 %call, 0, !dbg !175
  br i1 %tobool, label %if.then, label %if.end, !dbg !177

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !178
  br label %if.end, !dbg !180

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !181
  %tobool2 = icmp ne i32 %call1, 0, !dbg !181
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !183

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !184, metadata !DIExpression()), !dbg !187
  %0 = load i8*, i8** %data, align 8, !dbg !188
  %call4 = call i64 @strlen(i8* %0) #5, !dbg !189
  store i64 %call4, i64* %dataLen, align 8, !dbg !187
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !190, metadata !DIExpression()), !dbg !191
  %1 = load i64, i64* %dataLen, align 8, !dbg !192
  %add = add i64 %1, 1, !dbg !192
  %mul = mul i64 %add, 1, !dbg !192
  %2 = alloca i8, i64 %mul, align 16, !dbg !192
  store i8* %2, i8** %dest, align 8, !dbg !191
  %3 = load i8*, i8** %dest, align 8, !dbg !193
  %4 = load i8*, i8** %data, align 8, !dbg !194
  %call5 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !195
  %5 = load i8*, i8** %dest, align 8, !dbg !196
  call void @printLine(i8* %5), !dbg !197
  br label %if.end6, !dbg !198

if.end6:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !199
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_11.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_11_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_11.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocation(line: 30, column: 10, scope: !18)
!25 = !DILocation(line: 31, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 8)
!27 = !DILocation(line: 31, column: 8, scope: !18)
!28 = !DILocation(line: 34, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !19, line: 32, column: 5)
!30 = !DILocation(line: 35, column: 5, scope: !29)
!31 = !DILocation(line: 36, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !19, line: 36, column: 8)
!33 = !DILocation(line: 36, column: 8, scope: !18)
!34 = !DILocalVariable(name: "dataLen", scope: !35, file: !19, line: 40, type: !37)
!35 = distinct !DILexicalBlock(scope: !36, file: !19, line: 38, column: 9)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 37, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !38)
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 40, column: 20, scope: !35)
!40 = !DILocation(line: 40, column: 45, scope: !35)
!41 = !DILocation(line: 40, column: 30, scope: !35)
!42 = !DILocalVariable(name: "dest", scope: !35, file: !19, line: 41, type: !4)
!43 = !DILocation(line: 41, column: 20, scope: !35)
!44 = !DILocation(line: 41, column: 35, scope: !35)
!45 = !DILocation(line: 42, column: 26, scope: !35)
!46 = !DILocation(line: 42, column: 32, scope: !35)
!47 = !DILocation(line: 42, column: 19, scope: !35)
!48 = !DILocation(line: 43, column: 31, scope: !35)
!49 = !DILocation(line: 43, column: 13, scope: !35)
!50 = !DILocation(line: 45, column: 5, scope: !36)
!51 = !DILocation(line: 46, column: 1, scope: !18)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_11_good", scope: !19, file: !19, line: 150, type: !20, scopeLine: 151, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 152, column: 5, scope: !52)
!54 = !DILocation(line: 153, column: 5, scope: !52)
!55 = !DILocation(line: 154, column: 5, scope: !52)
!56 = !DILocation(line: 155, column: 5, scope: !52)
!57 = !DILocation(line: 156, column: 1, scope: !52)
!58 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 167, type: !59, scopeLine: 168, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!11, !11, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !19, line: 167, type: !11)
!63 = !DILocation(line: 167, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !19, line: 167, type: !61)
!65 = !DILocation(line: 167, column: 27, scope: !58)
!66 = !DILocation(line: 170, column: 22, scope: !58)
!67 = !DILocation(line: 170, column: 12, scope: !58)
!68 = !DILocation(line: 170, column: 5, scope: !58)
!69 = !DILocation(line: 172, column: 5, scope: !58)
!70 = !DILocation(line: 173, column: 5, scope: !58)
!71 = !DILocation(line: 174, column: 5, scope: !58)
!72 = !DILocation(line: 177, column: 5, scope: !58)
!73 = !DILocation(line: 178, column: 5, scope: !58)
!74 = !DILocation(line: 179, column: 5, scope: !58)
!75 = !DILocation(line: 181, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "goodB2G1", scope: !19, file: !19, line: 53, type: !20, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !19, line: 55, type: !4)
!78 = !DILocation(line: 55, column: 12, scope: !76)
!79 = !DILocation(line: 56, column: 10, scope: !76)
!80 = !DILocation(line: 57, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !19, line: 57, column: 8)
!82 = !DILocation(line: 57, column: 8, scope: !76)
!83 = !DILocation(line: 60, column: 14, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !19, line: 58, column: 5)
!85 = !DILocation(line: 61, column: 5, scope: !84)
!86 = !DILocation(line: 62, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !76, file: !19, line: 62, column: 8)
!88 = !DILocation(line: 62, column: 8, scope: !76)
!89 = !DILocation(line: 65, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !19, line: 63, column: 5)
!91 = !DILocation(line: 66, column: 5, scope: !90)
!92 = !DILocalVariable(name: "dataLen", scope: !93, file: !19, line: 71, type: !37)
!93 = distinct !DILexicalBlock(scope: !94, file: !19, line: 69, column: 9)
!94 = distinct !DILexicalBlock(scope: !87, file: !19, line: 68, column: 5)
!95 = !DILocation(line: 71, column: 20, scope: !93)
!96 = !DILocation(line: 71, column: 48, scope: !93)
!97 = !DILocation(line: 71, column: 37, scope: !93)
!98 = !DILocation(line: 71, column: 30, scope: !93)
!99 = !DILocalVariable(name: "dest", scope: !93, file: !19, line: 72, type: !4)
!100 = !DILocation(line: 72, column: 20, scope: !93)
!101 = !DILocation(line: 72, column: 35, scope: !93)
!102 = !DILocation(line: 73, column: 26, scope: !93)
!103 = !DILocation(line: 73, column: 32, scope: !93)
!104 = !DILocation(line: 73, column: 19, scope: !93)
!105 = !DILocation(line: 74, column: 35, scope: !93)
!106 = !DILocation(line: 74, column: 24, scope: !93)
!107 = !DILocation(line: 74, column: 13, scope: !93)
!108 = !DILocation(line: 77, column: 1, scope: !76)
!109 = distinct !DISubprogram(name: "goodB2G2", scope: !19, file: !19, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !19, line: 82, type: !4)
!111 = !DILocation(line: 82, column: 12, scope: !109)
!112 = !DILocation(line: 83, column: 10, scope: !109)
!113 = !DILocation(line: 84, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !19, line: 84, column: 8)
!115 = !DILocation(line: 84, column: 8, scope: !109)
!116 = !DILocation(line: 87, column: 14, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !19, line: 85, column: 5)
!118 = !DILocation(line: 88, column: 5, scope: !117)
!119 = !DILocation(line: 89, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !109, file: !19, line: 89, column: 8)
!121 = !DILocation(line: 89, column: 8, scope: !109)
!122 = !DILocalVariable(name: "dataLen", scope: !123, file: !19, line: 93, type: !37)
!123 = distinct !DILexicalBlock(scope: !124, file: !19, line: 91, column: 9)
!124 = distinct !DILexicalBlock(scope: !120, file: !19, line: 90, column: 5)
!125 = !DILocation(line: 93, column: 20, scope: !123)
!126 = !DILocation(line: 93, column: 48, scope: !123)
!127 = !DILocation(line: 93, column: 37, scope: !123)
!128 = !DILocation(line: 93, column: 30, scope: !123)
!129 = !DILocalVariable(name: "dest", scope: !123, file: !19, line: 94, type: !4)
!130 = !DILocation(line: 94, column: 20, scope: !123)
!131 = !DILocation(line: 94, column: 35, scope: !123)
!132 = !DILocation(line: 95, column: 26, scope: !123)
!133 = !DILocation(line: 95, column: 32, scope: !123)
!134 = !DILocation(line: 95, column: 19, scope: !123)
!135 = !DILocation(line: 96, column: 35, scope: !123)
!136 = !DILocation(line: 96, column: 24, scope: !123)
!137 = !DILocation(line: 96, column: 13, scope: !123)
!138 = !DILocation(line: 98, column: 5, scope: !124)
!139 = !DILocation(line: 99, column: 1, scope: !109)
!140 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 102, type: !20, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!141 = !DILocalVariable(name: "data", scope: !140, file: !19, line: 104, type: !4)
!142 = !DILocation(line: 104, column: 12, scope: !140)
!143 = !DILocation(line: 105, column: 10, scope: !140)
!144 = !DILocation(line: 106, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !19, line: 106, column: 8)
!146 = !DILocation(line: 106, column: 8, scope: !140)
!147 = !DILocation(line: 109, column: 9, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !19, line: 107, column: 5)
!149 = !DILocation(line: 110, column: 5, scope: !148)
!150 = !DILocation(line: 114, column: 14, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !19, line: 112, column: 5)
!152 = !DILocation(line: 116, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !140, file: !19, line: 116, column: 8)
!154 = !DILocation(line: 116, column: 8, scope: !140)
!155 = !DILocalVariable(name: "dataLen", scope: !156, file: !19, line: 120, type: !37)
!156 = distinct !DILexicalBlock(scope: !157, file: !19, line: 118, column: 9)
!157 = distinct !DILexicalBlock(scope: !153, file: !19, line: 117, column: 5)
!158 = !DILocation(line: 120, column: 20, scope: !156)
!159 = !DILocation(line: 120, column: 45, scope: !156)
!160 = !DILocation(line: 120, column: 30, scope: !156)
!161 = !DILocalVariable(name: "dest", scope: !156, file: !19, line: 121, type: !4)
!162 = !DILocation(line: 121, column: 20, scope: !156)
!163 = !DILocation(line: 121, column: 35, scope: !156)
!164 = !DILocation(line: 122, column: 26, scope: !156)
!165 = !DILocation(line: 122, column: 32, scope: !156)
!166 = !DILocation(line: 122, column: 19, scope: !156)
!167 = !DILocation(line: 123, column: 31, scope: !156)
!168 = !DILocation(line: 123, column: 13, scope: !156)
!169 = !DILocation(line: 125, column: 5, scope: !157)
!170 = !DILocation(line: 126, column: 1, scope: !140)
!171 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 129, type: !20, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!172 = !DILocalVariable(name: "data", scope: !171, file: !19, line: 131, type: !4)
!173 = !DILocation(line: 131, column: 12, scope: !171)
!174 = !DILocation(line: 132, column: 10, scope: !171)
!175 = !DILocation(line: 133, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !19, line: 133, column: 8)
!177 = !DILocation(line: 133, column: 8, scope: !171)
!178 = !DILocation(line: 136, column: 14, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !19, line: 134, column: 5)
!180 = !DILocation(line: 137, column: 5, scope: !179)
!181 = !DILocation(line: 138, column: 8, scope: !182)
!182 = distinct !DILexicalBlock(scope: !171, file: !19, line: 138, column: 8)
!183 = !DILocation(line: 138, column: 8, scope: !171)
!184 = !DILocalVariable(name: "dataLen", scope: !185, file: !19, line: 142, type: !37)
!185 = distinct !DILexicalBlock(scope: !186, file: !19, line: 140, column: 9)
!186 = distinct !DILexicalBlock(scope: !182, file: !19, line: 139, column: 5)
!187 = !DILocation(line: 142, column: 20, scope: !185)
!188 = !DILocation(line: 142, column: 45, scope: !185)
!189 = !DILocation(line: 142, column: 30, scope: !185)
!190 = !DILocalVariable(name: "dest", scope: !185, file: !19, line: 143, type: !4)
!191 = !DILocation(line: 143, column: 20, scope: !185)
!192 = !DILocation(line: 143, column: 35, scope: !185)
!193 = !DILocation(line: 144, column: 26, scope: !185)
!194 = !DILocation(line: 144, column: 32, scope: !185)
!195 = !DILocation(line: 144, column: 19, scope: !185)
!196 = !DILocation(line: 145, column: 31, scope: !185)
!197 = !DILocation(line: 145, column: 13, scope: !185)
!198 = !DILocation(line: 147, column: 5, scope: !186)
!199 = !DILocation(line: 148, column: 1, scope: !171)
