; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@CWE121_Stack_Based_Buffer_Overflow__CWE135_45_badData = internal global i8* null, align 8, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE135_45_goodG2BData = internal global i8* null, align 8, !dbg !15
@CWE121_Stack_Based_Buffer_Overflow__CWE135_45_goodB2GData = internal global i8* null, align 8, !dbg !18

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_45_bad() #0 !dbg !26 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store i8* null, i8** %data, align 8, !dbg !31
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %0, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_45_badData, align 8, !dbg !34
  call void @badSink(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_45_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  call void @goodB2G(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #5, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #5, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_45_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_45_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_45_badData, align 8, !dbg !62
  store i8* %0, i8** %data, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !63, metadata !DIExpression()), !dbg !67
  %1 = load i8*, i8** %data, align 8, !dbg !68
  %call = call i64 @strlen(i8* %1) #6, !dbg !69
  store i64 %call, i64* %dataLen, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !70, metadata !DIExpression()), !dbg !71
  %2 = load i64, i64* %dataLen, align 8, !dbg !72
  %add = add i64 %2, 1, !dbg !72
  %mul = mul i64 %add, 4, !dbg !72
  %3 = alloca i8, i64 %mul, align 16, !dbg !72
  store i8* %3, i8** %dest, align 8, !dbg !71
  %4 = load i8*, i8** %dest, align 8, !dbg !73
  %5 = bitcast i8* %4 to i32*, !dbg !73
  %6 = load i8*, i8** %data, align 8, !dbg !74
  %7 = bitcast i8* %6 to i32*, !dbg !74
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #5, !dbg !75
  %8 = load i8*, i8** %dest, align 8, !dbg !76
  call void @printLine(i8* %8), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i8* null, i8** %data, align 8, !dbg !82
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  store i8* %0, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_45_goodG2BData, align 8, !dbg !85
  call void @goodG2BSink(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_45_goodG2BData, align 8, !dbg !91
  store i8* %0, i8** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !92, metadata !DIExpression()), !dbg !94
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %call = call i64 @strlen(i8* %1) #6, !dbg !96
  store i64 %call, i64* %dataLen, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !97, metadata !DIExpression()), !dbg !98
  %2 = load i64, i64* %dataLen, align 8, !dbg !99
  %add = add i64 %2, 1, !dbg !99
  %mul = mul i64 %add, 1, !dbg !99
  %3 = alloca i8, i64 %mul, align 16, !dbg !99
  store i8* %3, i8** %dest, align 8, !dbg !98
  %4 = load i8*, i8** %dest, align 8, !dbg !100
  %5 = load i8*, i8** %data, align 8, !dbg !101
  %call1 = call i8* @strcpy(i8* %4, i8* %5) #5, !dbg !102
  %6 = load i8*, i8** %dest, align 8, !dbg !103
  call void @printLine(i8* %6), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* null, i8** %data, align 8, !dbg !109
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !110
  %0 = load i8*, i8** %data, align 8, !dbg !111
  store i8* %0, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_45_goodB2GData, align 8, !dbg !112
  call void @goodB2GSink(), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_45_goodB2GData, align 8, !dbg !118
  store i8* %0, i8** %data, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !119, metadata !DIExpression()), !dbg !121
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %2 = bitcast i8* %1 to i32*, !dbg !123
  %call = call i64 @wcslen(i32* %2) #6, !dbg !124
  store i64 %call, i64* %dataLen, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !125, metadata !DIExpression()), !dbg !126
  %3 = load i64, i64* %dataLen, align 8, !dbg !127
  %add = add i64 %3, 1, !dbg !127
  %mul = mul i64 %add, 4, !dbg !127
  %4 = alloca i8, i64 %mul, align 16, !dbg !127
  store i8* %4, i8** %dest, align 8, !dbg !126
  %5 = load i8*, i8** %dest, align 8, !dbg !128
  %6 = bitcast i8* %5 to i32*, !dbg !128
  %7 = load i8*, i8** %data, align 8, !dbg !129
  %8 = bitcast i8* %7 to i32*, !dbg !129
  %call1 = call i32* @wcscpy(i32* %6, i32* %8) #5, !dbg !130
  %9 = load i8*, i8** %dest, align 8, !dbg !131
  %10 = bitcast i8* %9 to i32*, !dbg !132
  call void @printWLine(i32* %10), !dbg !133
  ret void, !dbg !134
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_45_badData", scope: !2, file: !17, line: 25, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !8, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{!0, !15, !18}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_45_goodG2BData", scope: !2, file: !17, line: 26, type: !6, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_45.c", directory: "/root/SSE-Assessment")
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_45_goodB2GData", scope: !2, file: !17, line: 27, type: !6, isLocal: true, isDefinition: true)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"clang version 13.0.0"}
!26 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_45_bad", scope: !17, file: !17, line: 43, type: !27, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "data", scope: !26, file: !17, line: 45, type: !6)
!30 = !DILocation(line: 45, column: 12, scope: !26)
!31 = !DILocation(line: 46, column: 10, scope: !26)
!32 = !DILocation(line: 48, column: 10, scope: !26)
!33 = !DILocation(line: 49, column: 61, scope: !26)
!34 = !DILocation(line: 49, column: 59, scope: !26)
!35 = !DILocation(line: 50, column: 5, scope: !26)
!36 = !DILocation(line: 51, column: 1, scope: !26)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_45_good", scope: !17, file: !17, line: 103, type: !27, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DILocation(line: 105, column: 5, scope: !37)
!39 = !DILocation(line: 106, column: 5, scope: !37)
!40 = !DILocation(line: 107, column: 1, scope: !37)
!41 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 117, type: !42, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!13, !13, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !17, line: 117, type: !13)
!46 = !DILocation(line: 117, column: 14, scope: !41)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !17, line: 117, type: !44)
!48 = !DILocation(line: 117, column: 27, scope: !41)
!49 = !DILocation(line: 120, column: 22, scope: !41)
!50 = !DILocation(line: 120, column: 12, scope: !41)
!51 = !DILocation(line: 120, column: 5, scope: !41)
!52 = !DILocation(line: 122, column: 5, scope: !41)
!53 = !DILocation(line: 123, column: 5, scope: !41)
!54 = !DILocation(line: 124, column: 5, scope: !41)
!55 = !DILocation(line: 127, column: 5, scope: !41)
!56 = !DILocation(line: 128, column: 5, scope: !41)
!57 = !DILocation(line: 129, column: 5, scope: !41)
!58 = !DILocation(line: 131, column: 5, scope: !41)
!59 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 31, type: !27, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocalVariable(name: "data", scope: !59, file: !17, line: 33, type: !6)
!61 = !DILocation(line: 33, column: 12, scope: !59)
!62 = !DILocation(line: 33, column: 19, scope: !59)
!63 = !DILocalVariable(name: "dataLen", scope: !64, file: !17, line: 36, type: !65)
!64 = distinct !DILexicalBlock(scope: !59, file: !17, line: 34, column: 5)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !12, line: 46, baseType: !66)
!66 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!67 = !DILocation(line: 36, column: 16, scope: !64)
!68 = !DILocation(line: 36, column: 41, scope: !64)
!69 = !DILocation(line: 36, column: 26, scope: !64)
!70 = !DILocalVariable(name: "dest", scope: !64, file: !17, line: 37, type: !6)
!71 = !DILocation(line: 37, column: 16, scope: !64)
!72 = !DILocation(line: 37, column: 31, scope: !64)
!73 = !DILocation(line: 38, column: 22, scope: !64)
!74 = !DILocation(line: 38, column: 28, scope: !64)
!75 = !DILocation(line: 38, column: 15, scope: !64)
!76 = !DILocation(line: 39, column: 27, scope: !64)
!77 = !DILocation(line: 39, column: 9, scope: !64)
!78 = !DILocation(line: 41, column: 1, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 70, type: !27, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !17, line: 72, type: !6)
!81 = !DILocation(line: 72, column: 12, scope: !79)
!82 = !DILocation(line: 73, column: 10, scope: !79)
!83 = !DILocation(line: 75, column: 10, scope: !79)
!84 = !DILocation(line: 76, column: 65, scope: !79)
!85 = !DILocation(line: 76, column: 63, scope: !79)
!86 = !DILocation(line: 77, column: 5, scope: !79)
!87 = !DILocation(line: 78, column: 1, scope: !79)
!88 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 58, type: !27, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !17, line: 60, type: !6)
!90 = !DILocation(line: 60, column: 12, scope: !88)
!91 = !DILocation(line: 60, column: 19, scope: !88)
!92 = !DILocalVariable(name: "dataLen", scope: !93, file: !17, line: 63, type: !65)
!93 = distinct !DILexicalBlock(scope: !88, file: !17, line: 61, column: 5)
!94 = !DILocation(line: 63, column: 16, scope: !93)
!95 = !DILocation(line: 63, column: 41, scope: !93)
!96 = !DILocation(line: 63, column: 26, scope: !93)
!97 = !DILocalVariable(name: "dest", scope: !93, file: !17, line: 64, type: !6)
!98 = !DILocation(line: 64, column: 16, scope: !93)
!99 = !DILocation(line: 64, column: 31, scope: !93)
!100 = !DILocation(line: 65, column: 22, scope: !93)
!101 = !DILocation(line: 65, column: 28, scope: !93)
!102 = !DILocation(line: 65, column: 15, scope: !93)
!103 = !DILocation(line: 66, column: 27, scope: !93)
!104 = !DILocation(line: 66, column: 9, scope: !93)
!105 = !DILocation(line: 68, column: 1, scope: !88)
!106 = distinct !DISubprogram(name: "goodB2G", scope: !17, file: !17, line: 93, type: !27, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !17, line: 95, type: !6)
!108 = !DILocation(line: 95, column: 12, scope: !106)
!109 = !DILocation(line: 96, column: 10, scope: !106)
!110 = !DILocation(line: 98, column: 10, scope: !106)
!111 = !DILocation(line: 99, column: 65, scope: !106)
!112 = !DILocation(line: 99, column: 63, scope: !106)
!113 = !DILocation(line: 100, column: 5, scope: !106)
!114 = !DILocation(line: 101, column: 1, scope: !106)
!115 = distinct !DISubprogram(name: "goodB2GSink", scope: !17, file: !17, line: 81, type: !27, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !17, line: 83, type: !6)
!117 = !DILocation(line: 83, column: 12, scope: !115)
!118 = !DILocation(line: 83, column: 19, scope: !115)
!119 = !DILocalVariable(name: "dataLen", scope: !120, file: !17, line: 86, type: !65)
!120 = distinct !DILexicalBlock(scope: !115, file: !17, line: 84, column: 5)
!121 = !DILocation(line: 86, column: 16, scope: !120)
!122 = !DILocation(line: 86, column: 44, scope: !120)
!123 = !DILocation(line: 86, column: 33, scope: !120)
!124 = !DILocation(line: 86, column: 26, scope: !120)
!125 = !DILocalVariable(name: "dest", scope: !120, file: !17, line: 87, type: !6)
!126 = !DILocation(line: 87, column: 16, scope: !120)
!127 = !DILocation(line: 87, column: 31, scope: !120)
!128 = !DILocation(line: 88, column: 22, scope: !120)
!129 = !DILocation(line: 88, column: 28, scope: !120)
!130 = !DILocation(line: 88, column: 15, scope: !120)
!131 = !DILocation(line: 89, column: 31, scope: !120)
!132 = !DILocation(line: 89, column: 20, scope: !120)
!133 = !DILocation(line: 89, column: 9, scope: !120)
!134 = !DILocation(line: 91, column: 1, scope: !115)
