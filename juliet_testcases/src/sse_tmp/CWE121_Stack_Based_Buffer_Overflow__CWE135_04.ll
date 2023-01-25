; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_04_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !28, metadata !DIExpression()), !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i64 @strlen(i8* %0) #5, !dbg !36
  store i64 %call, i64* %dataLen, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !37, metadata !DIExpression()), !dbg !38
  %1 = load i64, i64* %dataLen, align 8, !dbg !39
  %add = add i64 %1, 1, !dbg !39
  %mul = mul i64 %add, 4, !dbg !39
  %2 = alloca i8, i64 %mul, align 16, !dbg !39
  store i8* %2, i8** %dest, align 8, !dbg !38
  %3 = load i8*, i8** %dest, align 8, !dbg !40
  %4 = bitcast i8* %3 to i32*, !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %6 = bitcast i8* %5 to i32*, !dbg !41
  %call1 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !42
  %7 = load i8*, i8** %dest, align 8, !dbg !43
  call void @printLine(i8* %7), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_04_good() #0 !dbg !46 {
entry:
  call void @goodB2G1(), !dbg !47
  call void @goodB2G2(), !dbg !48
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #6, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #6, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_04_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_04_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i8* null, i8** %data, align 8, !dbg !73
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !77, metadata !DIExpression()), !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %1 = bitcast i8* %0 to i32*, !dbg !83
  %call = call i64 @wcslen(i32* %1) #5, !dbg !84
  store i64 %call, i64* %dataLen, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = load i64, i64* %dataLen, align 8, !dbg !87
  %add = add i64 %2, 1, !dbg !87
  %mul = mul i64 %add, 4, !dbg !87
  %3 = alloca i8, i64 %mul, align 16, !dbg !87
  store i8* %3, i8** %dest, align 8, !dbg !86
  %4 = load i8*, i8** %dest, align 8, !dbg !88
  %5 = bitcast i8* %4 to i32*, !dbg !88
  %6 = load i8*, i8** %data, align 8, !dbg !89
  %7 = bitcast i8* %6 to i32*, !dbg !89
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !90
  %8 = load i8*, i8** %dest, align 8, !dbg !91
  %9 = bitcast i8* %8 to i32*, !dbg !92
  call void @printWLine(i32* %9), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i8* null, i8** %data, align 8, !dbg !98
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !102, metadata !DIExpression()), !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %1 = bitcast i8* %0 to i32*, !dbg !108
  %call = call i64 @wcslen(i32* %1) #5, !dbg !109
  store i64 %call, i64* %dataLen, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !110, metadata !DIExpression()), !dbg !111
  %2 = load i64, i64* %dataLen, align 8, !dbg !112
  %add = add i64 %2, 1, !dbg !112
  %mul = mul i64 %add, 4, !dbg !112
  %3 = alloca i8, i64 %mul, align 16, !dbg !112
  store i8* %3, i8** %dest, align 8, !dbg !111
  %4 = load i8*, i8** %dest, align 8, !dbg !113
  %5 = bitcast i8* %4 to i32*, !dbg !113
  %6 = load i8*, i8** %data, align 8, !dbg !114
  %7 = bitcast i8* %6 to i32*, !dbg !114
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !115
  %8 = load i8*, i8** %dest, align 8, !dbg !116
  %9 = bitcast i8* %8 to i32*, !dbg !117
  call void @printWLine(i32* %9), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !120 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i8* null, i8** %data, align 8, !dbg !123
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !127, metadata !DIExpression()), !dbg !131
  %0 = load i8*, i8** %data, align 8, !dbg !132
  %call = call i64 @strlen(i8* %0) #5, !dbg !133
  store i64 %call, i64* %dataLen, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !134, metadata !DIExpression()), !dbg !135
  %1 = load i64, i64* %dataLen, align 8, !dbg !136
  %add = add i64 %1, 1, !dbg !136
  %mul = mul i64 %add, 1, !dbg !136
  %2 = alloca i8, i64 %mul, align 16, !dbg !136
  store i8* %2, i8** %dest, align 8, !dbg !135
  %3 = load i8*, i8** %dest, align 8, !dbg !137
  %4 = load i8*, i8** %data, align 8, !dbg !138
  %call1 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !139
  %5 = load i8*, i8** %dest, align 8, !dbg !140
  call void @printLine(i8* %5), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !143 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !144, metadata !DIExpression()), !dbg !145
  store i8* null, i8** %data, align 8, !dbg !146
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !147
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !150, metadata !DIExpression()), !dbg !154
  %0 = load i8*, i8** %data, align 8, !dbg !155
  %call = call i64 @strlen(i8* %0) #5, !dbg !156
  store i64 %call, i64* %dataLen, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !157, metadata !DIExpression()), !dbg !158
  %1 = load i64, i64* %dataLen, align 8, !dbg !159
  %add = add i64 %1, 1, !dbg !159
  %mul = mul i64 %add, 1, !dbg !159
  %2 = alloca i8, i64 %mul, align 16, !dbg !159
  store i8* %2, i8** %dest, align 8, !dbg !158
  %3 = load i8*, i8** %dest, align 8, !dbg !160
  %4 = load i8*, i8** %data, align 8, !dbg !161
  %call1 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !162
  %5 = load i8*, i8** %dest, align 8, !dbg !163
  call void @printLine(i8* %5), !dbg !164
  ret void, !dbg !165
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_04_bad", scope: !19, file: !19, line: 33, type: !20, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_04.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 35, type: !4)
!23 = !DILocation(line: 35, column: 12, scope: !18)
!24 = !DILocation(line: 36, column: 10, scope: !18)
!25 = !DILocation(line: 40, column: 14, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !19, line: 38, column: 5)
!27 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 8)
!28 = !DILocalVariable(name: "dataLen", scope: !29, file: !19, line: 46, type: !32)
!29 = distinct !DILexicalBlock(scope: !30, file: !19, line: 44, column: 9)
!30 = distinct !DILexicalBlock(scope: !31, file: !19, line: 43, column: 5)
!31 = distinct !DILexicalBlock(scope: !18, file: !19, line: 42, column: 8)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !33)
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 46, column: 20, scope: !29)
!35 = !DILocation(line: 46, column: 45, scope: !29)
!36 = !DILocation(line: 46, column: 30, scope: !29)
!37 = !DILocalVariable(name: "dest", scope: !29, file: !19, line: 47, type: !4)
!38 = !DILocation(line: 47, column: 20, scope: !29)
!39 = !DILocation(line: 47, column: 35, scope: !29)
!40 = !DILocation(line: 48, column: 26, scope: !29)
!41 = !DILocation(line: 48, column: 32, scope: !29)
!42 = !DILocation(line: 48, column: 19, scope: !29)
!43 = !DILocation(line: 49, column: 31, scope: !29)
!44 = !DILocation(line: 49, column: 13, scope: !29)
!45 = !DILocation(line: 52, column: 1, scope: !18)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_04_good", scope: !19, file: !19, line: 156, type: !20, scopeLine: 157, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 158, column: 5, scope: !46)
!48 = !DILocation(line: 159, column: 5, scope: !46)
!49 = !DILocation(line: 160, column: 5, scope: !46)
!50 = !DILocation(line: 161, column: 5, scope: !46)
!51 = !DILocation(line: 162, column: 1, scope: !46)
!52 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 173, type: !53, scopeLine: 174, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!11, !11, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !19, line: 173, type: !11)
!57 = !DILocation(line: 173, column: 14, scope: !52)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !19, line: 173, type: !55)
!59 = !DILocation(line: 173, column: 27, scope: !52)
!60 = !DILocation(line: 176, column: 22, scope: !52)
!61 = !DILocation(line: 176, column: 12, scope: !52)
!62 = !DILocation(line: 176, column: 5, scope: !52)
!63 = !DILocation(line: 178, column: 5, scope: !52)
!64 = !DILocation(line: 179, column: 5, scope: !52)
!65 = !DILocation(line: 180, column: 5, scope: !52)
!66 = !DILocation(line: 183, column: 5, scope: !52)
!67 = !DILocation(line: 184, column: 5, scope: !52)
!68 = !DILocation(line: 185, column: 5, scope: !52)
!69 = !DILocation(line: 187, column: 5, scope: !52)
!70 = distinct !DISubprogram(name: "goodB2G1", scope: !19, file: !19, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !19, line: 61, type: !4)
!72 = !DILocation(line: 61, column: 12, scope: !70)
!73 = !DILocation(line: 62, column: 10, scope: !70)
!74 = !DILocation(line: 66, column: 14, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !19, line: 64, column: 5)
!76 = distinct !DILexicalBlock(scope: !70, file: !19, line: 63, column: 8)
!77 = !DILocalVariable(name: "dataLen", scope: !78, file: !19, line: 77, type: !32)
!78 = distinct !DILexicalBlock(scope: !79, file: !19, line: 75, column: 9)
!79 = distinct !DILexicalBlock(scope: !80, file: !19, line: 74, column: 5)
!80 = distinct !DILexicalBlock(scope: !70, file: !19, line: 68, column: 8)
!81 = !DILocation(line: 77, column: 20, scope: !78)
!82 = !DILocation(line: 77, column: 48, scope: !78)
!83 = !DILocation(line: 77, column: 37, scope: !78)
!84 = !DILocation(line: 77, column: 30, scope: !78)
!85 = !DILocalVariable(name: "dest", scope: !78, file: !19, line: 78, type: !4)
!86 = !DILocation(line: 78, column: 20, scope: !78)
!87 = !DILocation(line: 78, column: 35, scope: !78)
!88 = !DILocation(line: 79, column: 26, scope: !78)
!89 = !DILocation(line: 79, column: 32, scope: !78)
!90 = !DILocation(line: 79, column: 19, scope: !78)
!91 = !DILocation(line: 80, column: 35, scope: !78)
!92 = !DILocation(line: 80, column: 24, scope: !78)
!93 = !DILocation(line: 80, column: 13, scope: !78)
!94 = !DILocation(line: 83, column: 1, scope: !70)
!95 = distinct !DISubprogram(name: "goodB2G2", scope: !19, file: !19, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !19, line: 88, type: !4)
!97 = !DILocation(line: 88, column: 12, scope: !95)
!98 = !DILocation(line: 89, column: 10, scope: !95)
!99 = !DILocation(line: 93, column: 14, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !19, line: 91, column: 5)
!101 = distinct !DILexicalBlock(scope: !95, file: !19, line: 90, column: 8)
!102 = !DILocalVariable(name: "dataLen", scope: !103, file: !19, line: 99, type: !32)
!103 = distinct !DILexicalBlock(scope: !104, file: !19, line: 97, column: 9)
!104 = distinct !DILexicalBlock(scope: !105, file: !19, line: 96, column: 5)
!105 = distinct !DILexicalBlock(scope: !95, file: !19, line: 95, column: 8)
!106 = !DILocation(line: 99, column: 20, scope: !103)
!107 = !DILocation(line: 99, column: 48, scope: !103)
!108 = !DILocation(line: 99, column: 37, scope: !103)
!109 = !DILocation(line: 99, column: 30, scope: !103)
!110 = !DILocalVariable(name: "dest", scope: !103, file: !19, line: 100, type: !4)
!111 = !DILocation(line: 100, column: 20, scope: !103)
!112 = !DILocation(line: 100, column: 35, scope: !103)
!113 = !DILocation(line: 101, column: 26, scope: !103)
!114 = !DILocation(line: 101, column: 32, scope: !103)
!115 = !DILocation(line: 101, column: 19, scope: !103)
!116 = !DILocation(line: 102, column: 35, scope: !103)
!117 = !DILocation(line: 102, column: 24, scope: !103)
!118 = !DILocation(line: 102, column: 13, scope: !103)
!119 = !DILocation(line: 105, column: 1, scope: !95)
!120 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 108, type: !20, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !19, line: 110, type: !4)
!122 = !DILocation(line: 110, column: 12, scope: !120)
!123 = !DILocation(line: 111, column: 10, scope: !120)
!124 = !DILocation(line: 120, column: 14, scope: !125)
!125 = distinct !DILexicalBlock(scope: !126, file: !19, line: 118, column: 5)
!126 = distinct !DILexicalBlock(scope: !120, file: !19, line: 112, column: 8)
!127 = !DILocalVariable(name: "dataLen", scope: !128, file: !19, line: 126, type: !32)
!128 = distinct !DILexicalBlock(scope: !129, file: !19, line: 124, column: 9)
!129 = distinct !DILexicalBlock(scope: !130, file: !19, line: 123, column: 5)
!130 = distinct !DILexicalBlock(scope: !120, file: !19, line: 122, column: 8)
!131 = !DILocation(line: 126, column: 20, scope: !128)
!132 = !DILocation(line: 126, column: 45, scope: !128)
!133 = !DILocation(line: 126, column: 30, scope: !128)
!134 = !DILocalVariable(name: "dest", scope: !128, file: !19, line: 127, type: !4)
!135 = !DILocation(line: 127, column: 20, scope: !128)
!136 = !DILocation(line: 127, column: 35, scope: !128)
!137 = !DILocation(line: 128, column: 26, scope: !128)
!138 = !DILocation(line: 128, column: 32, scope: !128)
!139 = !DILocation(line: 128, column: 19, scope: !128)
!140 = !DILocation(line: 129, column: 31, scope: !128)
!141 = !DILocation(line: 129, column: 13, scope: !128)
!142 = !DILocation(line: 132, column: 1, scope: !120)
!143 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 135, type: !20, scopeLine: 136, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", scope: !143, file: !19, line: 137, type: !4)
!145 = !DILocation(line: 137, column: 12, scope: !143)
!146 = !DILocation(line: 138, column: 10, scope: !143)
!147 = !DILocation(line: 142, column: 14, scope: !148)
!148 = distinct !DILexicalBlock(scope: !149, file: !19, line: 140, column: 5)
!149 = distinct !DILexicalBlock(scope: !143, file: !19, line: 139, column: 8)
!150 = !DILocalVariable(name: "dataLen", scope: !151, file: !19, line: 148, type: !32)
!151 = distinct !DILexicalBlock(scope: !152, file: !19, line: 146, column: 9)
!152 = distinct !DILexicalBlock(scope: !153, file: !19, line: 145, column: 5)
!153 = distinct !DILexicalBlock(scope: !143, file: !19, line: 144, column: 8)
!154 = !DILocation(line: 148, column: 20, scope: !151)
!155 = !DILocation(line: 148, column: 45, scope: !151)
!156 = !DILocation(line: 148, column: 30, scope: !151)
!157 = !DILocalVariable(name: "dest", scope: !151, file: !19, line: 149, type: !4)
!158 = !DILocation(line: 149, column: 20, scope: !151)
!159 = !DILocation(line: 149, column: 35, scope: !151)
!160 = !DILocation(line: 150, column: 26, scope: !151)
!161 = !DILocation(line: 150, column: 32, scope: !151)
!162 = !DILocation(line: 150, column: 19, scope: !151)
!163 = !DILocation(line: 151, column: 31, scope: !151)
!164 = !DILocation(line: 151, column: 13, scope: !151)
!165 = !DILocation(line: 154, column: 1, scope: !143)
