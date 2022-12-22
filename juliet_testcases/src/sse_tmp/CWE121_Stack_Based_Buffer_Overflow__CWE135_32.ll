; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_32_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !28
  store i8* null, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !33
  %1 = load i8*, i8** %0, align 8, !dbg !34
  store i8* %1, i8** %data1, align 8, !dbg !32
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data1, align 8, !dbg !35
  %2 = load i8*, i8** %data1, align 8, !dbg !36
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !37
  store i8* %2, i8** %3, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !39, metadata !DIExpression()), !dbg !41
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !42
  %5 = load i8*, i8** %4, align 8, !dbg !43
  store i8* %5, i8** %data2, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !44, metadata !DIExpression()), !dbg !48
  %6 = load i8*, i8** %data2, align 8, !dbg !49
  %call = call i64 @strlen(i8* %6) #5, !dbg !50
  store i64 %call, i64* %dataLen, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !51, metadata !DIExpression()), !dbg !52
  %7 = load i64, i64* %dataLen, align 8, !dbg !53
  %add = add i64 %7, 1, !dbg !53
  %mul = mul i64 %add, 4, !dbg !53
  %8 = alloca i8, i64 %mul, align 16, !dbg !53
  store i8* %8, i8** %dest, align 8, !dbg !52
  %9 = load i8*, i8** %dest, align 8, !dbg !54
  %10 = bitcast i8* %9 to i32*, !dbg !54
  %11 = load i8*, i8** %data2, align 8, !dbg !55
  %12 = bitcast i8* %11 to i32*, !dbg !55
  %call3 = call i32* @wcscpy(i32* %10, i32* %12) #6, !dbg !56
  %13 = load i8*, i8** %dest, align 8, !dbg !57
  call void @printLine(i8* %13), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_32_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  call void @goodB2G(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_32_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_32_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !90, metadata !DIExpression()), !dbg !92
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !93
  %1 = load i8*, i8** %0, align 8, !dbg !94
  store i8* %1, i8** %data1, align 8, !dbg !92
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data1, align 8, !dbg !95
  %2 = load i8*, i8** %data1, align 8, !dbg !96
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !97
  store i8* %2, i8** %3, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !99, metadata !DIExpression()), !dbg !101
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !102
  %5 = load i8*, i8** %4, align 8, !dbg !103
  store i8* %5, i8** %data2, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !104, metadata !DIExpression()), !dbg !106
  %6 = load i8*, i8** %data2, align 8, !dbg !107
  %call = call i64 @strlen(i8* %6) #5, !dbg !108
  store i64 %call, i64* %dataLen, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !109, metadata !DIExpression()), !dbg !110
  %7 = load i64, i64* %dataLen, align 8, !dbg !111
  %add = add i64 %7, 1, !dbg !111
  %mul = mul i64 %add, 1, !dbg !111
  %8 = alloca i8, i64 %mul, align 16, !dbg !111
  store i8* %8, i8** %dest, align 8, !dbg !110
  %9 = load i8*, i8** %dest, align 8, !dbg !112
  %10 = load i8*, i8** %data2, align 8, !dbg !113
  %call3 = call i8* @strcpy(i8* %9, i8* %10) #6, !dbg !114
  %11 = load i8*, i8** %dest, align 8, !dbg !115
  call void @printLine(i8* %11), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !118 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !123, metadata !DIExpression()), !dbg !124
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !124
  store i8* null, i8** %data, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !126, metadata !DIExpression()), !dbg !128
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !129
  %1 = load i8*, i8** %0, align 8, !dbg !130
  store i8* %1, i8** %data1, align 8, !dbg !128
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data1, align 8, !dbg !131
  %2 = load i8*, i8** %data1, align 8, !dbg !132
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !133
  store i8* %2, i8** %3, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !135, metadata !DIExpression()), !dbg !137
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !138
  %5 = load i8*, i8** %4, align 8, !dbg !139
  store i8* %5, i8** %data2, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !140, metadata !DIExpression()), !dbg !142
  %6 = load i8*, i8** %data2, align 8, !dbg !143
  %7 = bitcast i8* %6 to i32*, !dbg !144
  %call = call i64 @wcslen(i32* %7) #5, !dbg !145
  store i64 %call, i64* %dataLen, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !146, metadata !DIExpression()), !dbg !147
  %8 = load i64, i64* %dataLen, align 8, !dbg !148
  %add = add i64 %8, 1, !dbg !148
  %mul = mul i64 %add, 4, !dbg !148
  %9 = alloca i8, i64 %mul, align 16, !dbg !148
  store i8* %9, i8** %dest, align 8, !dbg !147
  %10 = load i8*, i8** %dest, align 8, !dbg !149
  %11 = bitcast i8* %10 to i32*, !dbg !149
  %12 = load i8*, i8** %data2, align 8, !dbg !150
  %13 = bitcast i8* %12 to i32*, !dbg !150
  %call3 = call i32* @wcscpy(i32* %11, i32* %13) #6, !dbg !151
  %14 = load i8*, i8** %dest, align 8, !dbg !152
  %15 = bitcast i8* %14 to i32*, !dbg !153
  call void @printWLine(i32* %15), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_32.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_32_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_32.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocalVariable(name: "dataPtr1", scope: !18, file: !19, line: 30, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!26 = !DILocation(line: 30, column: 13, scope: !18)
!27 = !DILocalVariable(name: "dataPtr2", scope: !18, file: !19, line: 31, type: !25)
!28 = !DILocation(line: 31, column: 13, scope: !18)
!29 = !DILocation(line: 32, column: 10, scope: !18)
!30 = !DILocalVariable(name: "data", scope: !31, file: !19, line: 34, type: !4)
!31 = distinct !DILexicalBlock(scope: !18, file: !19, line: 33, column: 5)
!32 = !DILocation(line: 34, column: 16, scope: !31)
!33 = !DILocation(line: 34, column: 24, scope: !31)
!34 = !DILocation(line: 34, column: 23, scope: !31)
!35 = !DILocation(line: 36, column: 14, scope: !31)
!36 = !DILocation(line: 37, column: 21, scope: !31)
!37 = !DILocation(line: 37, column: 10, scope: !31)
!38 = !DILocation(line: 37, column: 19, scope: !31)
!39 = !DILocalVariable(name: "data", scope: !40, file: !19, line: 40, type: !4)
!40 = distinct !DILexicalBlock(scope: !18, file: !19, line: 39, column: 5)
!41 = !DILocation(line: 40, column: 16, scope: !40)
!42 = !DILocation(line: 40, column: 24, scope: !40)
!43 = !DILocation(line: 40, column: 23, scope: !40)
!44 = !DILocalVariable(name: "dataLen", scope: !45, file: !19, line: 43, type: !46)
!45 = distinct !DILexicalBlock(scope: !40, file: !19, line: 41, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 43, column: 20, scope: !45)
!49 = !DILocation(line: 43, column: 45, scope: !45)
!50 = !DILocation(line: 43, column: 30, scope: !45)
!51 = !DILocalVariable(name: "dest", scope: !45, file: !19, line: 44, type: !4)
!52 = !DILocation(line: 44, column: 20, scope: !45)
!53 = !DILocation(line: 44, column: 35, scope: !45)
!54 = !DILocation(line: 45, column: 26, scope: !45)
!55 = !DILocation(line: 45, column: 32, scope: !45)
!56 = !DILocation(line: 45, column: 19, scope: !45)
!57 = !DILocation(line: 46, column: 31, scope: !45)
!58 = !DILocation(line: 46, column: 13, scope: !45)
!59 = !DILocation(line: 49, column: 1, scope: !18)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_32_good", scope: !19, file: !19, line: 105, type: !20, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 107, column: 5, scope: !60)
!62 = !DILocation(line: 108, column: 5, scope: !60)
!63 = !DILocation(line: 109, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 119, type: !65, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!11, !11, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !19, line: 119, type: !11)
!69 = !DILocation(line: 119, column: 14, scope: !64)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !19, line: 119, type: !67)
!71 = !DILocation(line: 119, column: 27, scope: !64)
!72 = !DILocation(line: 122, column: 22, scope: !64)
!73 = !DILocation(line: 122, column: 12, scope: !64)
!74 = !DILocation(line: 122, column: 5, scope: !64)
!75 = !DILocation(line: 124, column: 5, scope: !64)
!76 = !DILocation(line: 125, column: 5, scope: !64)
!77 = !DILocation(line: 126, column: 5, scope: !64)
!78 = !DILocation(line: 129, column: 5, scope: !64)
!79 = !DILocation(line: 130, column: 5, scope: !64)
!80 = !DILocation(line: 131, column: 5, scope: !64)
!81 = !DILocation(line: 133, column: 5, scope: !64)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !19, line: 58, type: !4)
!84 = !DILocation(line: 58, column: 12, scope: !82)
!85 = !DILocalVariable(name: "dataPtr1", scope: !82, file: !19, line: 59, type: !25)
!86 = !DILocation(line: 59, column: 13, scope: !82)
!87 = !DILocalVariable(name: "dataPtr2", scope: !82, file: !19, line: 60, type: !25)
!88 = !DILocation(line: 60, column: 13, scope: !82)
!89 = !DILocation(line: 61, column: 10, scope: !82)
!90 = !DILocalVariable(name: "data", scope: !91, file: !19, line: 63, type: !4)
!91 = distinct !DILexicalBlock(scope: !82, file: !19, line: 62, column: 5)
!92 = !DILocation(line: 63, column: 16, scope: !91)
!93 = !DILocation(line: 63, column: 24, scope: !91)
!94 = !DILocation(line: 63, column: 23, scope: !91)
!95 = !DILocation(line: 65, column: 14, scope: !91)
!96 = !DILocation(line: 66, column: 21, scope: !91)
!97 = !DILocation(line: 66, column: 10, scope: !91)
!98 = !DILocation(line: 66, column: 19, scope: !91)
!99 = !DILocalVariable(name: "data", scope: !100, file: !19, line: 69, type: !4)
!100 = distinct !DILexicalBlock(scope: !82, file: !19, line: 68, column: 5)
!101 = !DILocation(line: 69, column: 16, scope: !100)
!102 = !DILocation(line: 69, column: 24, scope: !100)
!103 = !DILocation(line: 69, column: 23, scope: !100)
!104 = !DILocalVariable(name: "dataLen", scope: !105, file: !19, line: 72, type: !46)
!105 = distinct !DILexicalBlock(scope: !100, file: !19, line: 70, column: 9)
!106 = !DILocation(line: 72, column: 20, scope: !105)
!107 = !DILocation(line: 72, column: 45, scope: !105)
!108 = !DILocation(line: 72, column: 30, scope: !105)
!109 = !DILocalVariable(name: "dest", scope: !105, file: !19, line: 73, type: !4)
!110 = !DILocation(line: 73, column: 20, scope: !105)
!111 = !DILocation(line: 73, column: 35, scope: !105)
!112 = !DILocation(line: 74, column: 26, scope: !105)
!113 = !DILocation(line: 74, column: 32, scope: !105)
!114 = !DILocation(line: 74, column: 19, scope: !105)
!115 = !DILocation(line: 75, column: 31, scope: !105)
!116 = !DILocation(line: 75, column: 13, scope: !105)
!117 = !DILocation(line: 78, column: 1, scope: !82)
!118 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 81, type: !20, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !19, line: 83, type: !4)
!120 = !DILocation(line: 83, column: 12, scope: !118)
!121 = !DILocalVariable(name: "dataPtr1", scope: !118, file: !19, line: 84, type: !25)
!122 = !DILocation(line: 84, column: 13, scope: !118)
!123 = !DILocalVariable(name: "dataPtr2", scope: !118, file: !19, line: 85, type: !25)
!124 = !DILocation(line: 85, column: 13, scope: !118)
!125 = !DILocation(line: 86, column: 10, scope: !118)
!126 = !DILocalVariable(name: "data", scope: !127, file: !19, line: 88, type: !4)
!127 = distinct !DILexicalBlock(scope: !118, file: !19, line: 87, column: 5)
!128 = !DILocation(line: 88, column: 16, scope: !127)
!129 = !DILocation(line: 88, column: 24, scope: !127)
!130 = !DILocation(line: 88, column: 23, scope: !127)
!131 = !DILocation(line: 90, column: 14, scope: !127)
!132 = !DILocation(line: 91, column: 21, scope: !127)
!133 = !DILocation(line: 91, column: 10, scope: !127)
!134 = !DILocation(line: 91, column: 19, scope: !127)
!135 = !DILocalVariable(name: "data", scope: !136, file: !19, line: 94, type: !4)
!136 = distinct !DILexicalBlock(scope: !118, file: !19, line: 93, column: 5)
!137 = !DILocation(line: 94, column: 16, scope: !136)
!138 = !DILocation(line: 94, column: 24, scope: !136)
!139 = !DILocation(line: 94, column: 23, scope: !136)
!140 = !DILocalVariable(name: "dataLen", scope: !141, file: !19, line: 97, type: !46)
!141 = distinct !DILexicalBlock(scope: !136, file: !19, line: 95, column: 9)
!142 = !DILocation(line: 97, column: 20, scope: !141)
!143 = !DILocation(line: 97, column: 48, scope: !141)
!144 = !DILocation(line: 97, column: 37, scope: !141)
!145 = !DILocation(line: 97, column: 30, scope: !141)
!146 = !DILocalVariable(name: "dest", scope: !141, file: !19, line: 98, type: !4)
!147 = !DILocation(line: 98, column: 20, scope: !141)
!148 = !DILocation(line: 98, column: 35, scope: !141)
!149 = !DILocation(line: 99, column: 26, scope: !141)
!150 = !DILocation(line: 99, column: 32, scope: !141)
!151 = !DILocation(line: 99, column: 19, scope: !141)
!152 = !DILocation(line: 100, column: 35, scope: !141)
!153 = !DILocation(line: 100, column: 24, scope: !141)
!154 = !DILocation(line: 100, column: 13, scope: !141)
!155 = !DILocation(line: 103, column: 1, scope: !118)
