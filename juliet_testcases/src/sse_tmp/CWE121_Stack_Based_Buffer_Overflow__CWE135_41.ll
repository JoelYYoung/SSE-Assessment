; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_41_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  call void @badSink(i8* %0), !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !29 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !34, metadata !DIExpression()), !dbg !38
  %0 = load i8*, i8** %data.addr, align 8, !dbg !39
  %call = call i64 @strlen(i8* %0) #5, !dbg !40
  store i64 %call, i64* %dataLen, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !41, metadata !DIExpression()), !dbg !42
  %1 = load i64, i64* %dataLen, align 8, !dbg !43
  %add = add i64 %1, 1, !dbg !43
  %mul = mul i64 %add, 4, !dbg !43
  %2 = alloca i8, i64 %mul, align 16, !dbg !43
  store i8* %2, i8** %dest, align 8, !dbg !42
  %3 = load i8*, i8** %dest, align 8, !dbg !44
  %4 = bitcast i8* %3 to i32*, !dbg !44
  %5 = load i8*, i8** %data.addr, align 8, !dbg !45
  %6 = bitcast i8* %5 to i32*, !dbg !45
  %call1 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !46
  %7 = load i8*, i8** %dest, align 8, !dbg !47
  call void @printLine(i8* %7), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_41_good() #0 !dbg !50 {
entry:
  call void @goodB2G(), !dbg !51
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #6, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #6, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_41_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_41_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i8* null, i8** %data, align 8, !dbg !75
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !76
  %0 = load i8*, i8** %data, align 8, !dbg !77
  call void @goodB2GSink(i8* %0), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i8* %data) #0 !dbg !80 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !83, metadata !DIExpression()), !dbg !85
  %0 = load i8*, i8** %data.addr, align 8, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  %call = call i64 @wcslen(i32* %1) #5, !dbg !88
  store i64 %call, i64* %dataLen, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !89, metadata !DIExpression()), !dbg !90
  %2 = load i64, i64* %dataLen, align 8, !dbg !91
  %add = add i64 %2, 1, !dbg !91
  %mul = mul i64 %add, 4, !dbg !91
  %3 = alloca i8, i64 %mul, align 16, !dbg !91
  store i8* %3, i8** %dest, align 8, !dbg !90
  %4 = load i8*, i8** %dest, align 8, !dbg !92
  %5 = bitcast i8* %4 to i32*, !dbg !92
  %6 = load i8*, i8** %data.addr, align 8, !dbg !93
  %7 = bitcast i8* %6 to i32*, !dbg !93
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !94
  %8 = load i8*, i8** %dest, align 8, !dbg !95
  %9 = bitcast i8* %8 to i32*, !dbg !96
  call void @printWLine(i32* %9), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  call void @goodG2BSink(i8* %0), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !107 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !110, metadata !DIExpression()), !dbg !112
  %0 = load i8*, i8** %data.addr, align 8, !dbg !113
  %call = call i64 @strlen(i8* %0) #5, !dbg !114
  store i64 %call, i64* %dataLen, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !115, metadata !DIExpression()), !dbg !116
  %1 = load i64, i64* %dataLen, align 8, !dbg !117
  %add = add i64 %1, 1, !dbg !117
  %mul = mul i64 %add, 1, !dbg !117
  %2 = alloca i8, i64 %mul, align 16, !dbg !117
  store i8* %2, i8** %dest, align 8, !dbg !116
  %3 = load i8*, i8** %dest, align 8, !dbg !118
  %4 = load i8*, i8** %data.addr, align 8, !dbg !119
  %call1 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !120
  %5 = load i8*, i8** %dest, align 8, !dbg !121
  call void @printLine(i8* %5), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !6, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
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
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_41_bad", scope: !19, file: !19, line: 38, type: !20, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_41.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 40, type: !4)
!23 = !DILocation(line: 40, column: 12, scope: !18)
!24 = !DILocation(line: 41, column: 10, scope: !18)
!25 = !DILocation(line: 43, column: 10, scope: !18)
!26 = !DILocation(line: 44, column: 13, scope: !18)
!27 = !DILocation(line: 44, column: 5, scope: !18)
!28 = !DILocation(line: 45, column: 1, scope: !18)
!29 = distinct !DISubprogram(name: "badSink", scope: !19, file: !19, line: 27, type: !30, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !4}
!32 = !DILocalVariable(name: "data", arg: 1, scope: !29, file: !19, line: 27, type: !4)
!33 = !DILocation(line: 27, column: 28, scope: !29)
!34 = !DILocalVariable(name: "dataLen", scope: !35, file: !19, line: 31, type: !36)
!35 = distinct !DILexicalBlock(scope: !29, file: !19, line: 29, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !37)
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 31, column: 16, scope: !35)
!39 = !DILocation(line: 31, column: 41, scope: !35)
!40 = !DILocation(line: 31, column: 26, scope: !35)
!41 = !DILocalVariable(name: "dest", scope: !35, file: !19, line: 32, type: !4)
!42 = !DILocation(line: 32, column: 16, scope: !35)
!43 = !DILocation(line: 32, column: 31, scope: !35)
!44 = !DILocation(line: 33, column: 22, scope: !35)
!45 = !DILocation(line: 33, column: 28, scope: !35)
!46 = !DILocation(line: 33, column: 15, scope: !35)
!47 = !DILocation(line: 34, column: 27, scope: !35)
!48 = !DILocation(line: 34, column: 9, scope: !35)
!49 = !DILocation(line: 36, column: 1, scope: !29)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_41_good", scope: !19, file: !19, line: 93, type: !20, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 95, column: 5, scope: !50)
!52 = !DILocation(line: 96, column: 5, scope: !50)
!53 = !DILocation(line: 97, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 108, type: !55, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!11, !11, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !19, line: 108, type: !11)
!59 = !DILocation(line: 108, column: 14, scope: !54)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !19, line: 108, type: !57)
!61 = !DILocation(line: 108, column: 27, scope: !54)
!62 = !DILocation(line: 111, column: 22, scope: !54)
!63 = !DILocation(line: 111, column: 12, scope: !54)
!64 = !DILocation(line: 111, column: 5, scope: !54)
!65 = !DILocation(line: 113, column: 5, scope: !54)
!66 = !DILocation(line: 114, column: 5, scope: !54)
!67 = !DILocation(line: 115, column: 5, scope: !54)
!68 = !DILocation(line: 118, column: 5, scope: !54)
!69 = !DILocation(line: 119, column: 5, scope: !54)
!70 = !DILocation(line: 120, column: 5, scope: !54)
!71 = !DILocation(line: 122, column: 5, scope: !54)
!72 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !19, line: 86, type: !4)
!74 = !DILocation(line: 86, column: 12, scope: !72)
!75 = !DILocation(line: 87, column: 10, scope: !72)
!76 = !DILocation(line: 89, column: 10, scope: !72)
!77 = !DILocation(line: 90, column: 17, scope: !72)
!78 = !DILocation(line: 90, column: 5, scope: !72)
!79 = !DILocation(line: 91, column: 1, scope: !72)
!80 = distinct !DISubprogram(name: "goodB2GSink", scope: !19, file: !19, line: 73, type: !30, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", arg: 1, scope: !80, file: !19, line: 73, type: !4)
!82 = !DILocation(line: 73, column: 32, scope: !80)
!83 = !DILocalVariable(name: "dataLen", scope: !84, file: !19, line: 77, type: !36)
!84 = distinct !DILexicalBlock(scope: !80, file: !19, line: 75, column: 5)
!85 = !DILocation(line: 77, column: 16, scope: !84)
!86 = !DILocation(line: 77, column: 44, scope: !84)
!87 = !DILocation(line: 77, column: 33, scope: !84)
!88 = !DILocation(line: 77, column: 26, scope: !84)
!89 = !DILocalVariable(name: "dest", scope: !84, file: !19, line: 78, type: !4)
!90 = !DILocation(line: 78, column: 16, scope: !84)
!91 = !DILocation(line: 78, column: 31, scope: !84)
!92 = !DILocation(line: 79, column: 22, scope: !84)
!93 = !DILocation(line: 79, column: 28, scope: !84)
!94 = !DILocation(line: 79, column: 15, scope: !84)
!95 = !DILocation(line: 80, column: 31, scope: !84)
!96 = !DILocation(line: 80, column: 20, scope: !84)
!97 = !DILocation(line: 80, column: 9, scope: !84)
!98 = !DILocation(line: 82, column: 1, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !19, line: 65, type: !4)
!101 = !DILocation(line: 65, column: 12, scope: !99)
!102 = !DILocation(line: 66, column: 10, scope: !99)
!103 = !DILocation(line: 68, column: 10, scope: !99)
!104 = !DILocation(line: 69, column: 17, scope: !99)
!105 = !DILocation(line: 69, column: 5, scope: !99)
!106 = !DILocation(line: 70, column: 1, scope: !99)
!107 = distinct !DISubprogram(name: "goodG2BSink", scope: !19, file: !19, line: 52, type: !30, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", arg: 1, scope: !107, file: !19, line: 52, type: !4)
!109 = !DILocation(line: 52, column: 32, scope: !107)
!110 = !DILocalVariable(name: "dataLen", scope: !111, file: !19, line: 56, type: !36)
!111 = distinct !DILexicalBlock(scope: !107, file: !19, line: 54, column: 5)
!112 = !DILocation(line: 56, column: 16, scope: !111)
!113 = !DILocation(line: 56, column: 41, scope: !111)
!114 = !DILocation(line: 56, column: 26, scope: !111)
!115 = !DILocalVariable(name: "dest", scope: !111, file: !19, line: 57, type: !4)
!116 = !DILocation(line: 57, column: 16, scope: !111)
!117 = !DILocation(line: 57, column: 31, scope: !111)
!118 = !DILocation(line: 58, column: 22, scope: !111)
!119 = !DILocation(line: 58, column: 28, scope: !111)
!120 = !DILocation(line: 58, column: 15, scope: !111)
!121 = !DILocation(line: 59, column: 27, scope: !111)
!122 = !DILocation(line: 59, column: 9, scope: !111)
!123 = !DILocation(line: 61, column: 1, scope: !107)
