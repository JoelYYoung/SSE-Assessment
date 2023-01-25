; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_44_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !24, metadata !DIExpression()), !dbg !28
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !28
  store i8* null, i8** %data, align 8, !dbg !29
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !30
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  call void %0(i8* %1), !dbg !31
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !37, metadata !DIExpression()), !dbg !41
  %0 = load i8*, i8** %data.addr, align 8, !dbg !42
  %call = call i64 @strlen(i8* %0) #5, !dbg !43
  store i64 %call, i64* %dataLen, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !44, metadata !DIExpression()), !dbg !45
  %1 = load i64, i64* %dataLen, align 8, !dbg !46
  %add = add i64 %1, 1, !dbg !46
  %mul = mul i64 %add, 4, !dbg !46
  %2 = alloca i8, i64 %mul, align 16, !dbg !46
  store i8* %2, i8** %dest, align 8, !dbg !45
  %3 = load i8*, i8** %dest, align 8, !dbg !47
  %4 = bitcast i8* %3 to i32*, !dbg !47
  %5 = load i8*, i8** %data.addr, align 8, !dbg !48
  %6 = bitcast i8* %5 to i32*, !dbg !48
  %call1 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !49
  %7 = load i8*, i8** %dest, align 8, !dbg !50
  call void @printLine(i8* %7), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_44_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  call void @goodB2G(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_44_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_44_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
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
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !78, metadata !DIExpression()), !dbg !79
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !81
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !82
  %1 = load i8*, i8** %data, align 8, !dbg !83
  call void %0(i8* %1), !dbg !82
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !85 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !88, metadata !DIExpression()), !dbg !90
  %0 = load i8*, i8** %data.addr, align 8, !dbg !91
  %call = call i64 @strlen(i8* %0) #5, !dbg !92
  store i64 %call, i64* %dataLen, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !93, metadata !DIExpression()), !dbg !94
  %1 = load i64, i64* %dataLen, align 8, !dbg !95
  %add = add i64 %1, 1, !dbg !95
  %mul = mul i64 %add, 1, !dbg !95
  %2 = alloca i8, i64 %mul, align 16, !dbg !95
  store i8* %2, i8** %dest, align 8, !dbg !94
  %3 = load i8*, i8** %dest, align 8, !dbg !96
  %4 = load i8*, i8** %data.addr, align 8, !dbg !97
  %call1 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !98
  %5 = load i8*, i8** %dest, align 8, !dbg !99
  call void @printLine(i8* %5), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !105, metadata !DIExpression()), !dbg !106
  store void (i8*)* @goodB2GSink, void (i8*)** %funcPtr, align 8, !dbg !106
  store i8* null, i8** %data, align 8, !dbg !107
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !108
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !109
  %1 = load i8*, i8** %data, align 8, !dbg !110
  call void %0(i8* %1), !dbg !109
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i8* %data) #0 !dbg !112 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !115, metadata !DIExpression()), !dbg !117
  %0 = load i8*, i8** %data.addr, align 8, !dbg !118
  %1 = bitcast i8* %0 to i32*, !dbg !119
  %call = call i64 @wcslen(i32* %1) #5, !dbg !120
  store i64 %call, i64* %dataLen, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !121, metadata !DIExpression()), !dbg !122
  %2 = load i64, i64* %dataLen, align 8, !dbg !123
  %add = add i64 %2, 1, !dbg !123
  %mul = mul i64 %add, 4, !dbg !123
  %3 = alloca i8, i64 %mul, align 16, !dbg !123
  store i8* %3, i8** %dest, align 8, !dbg !122
  %4 = load i8*, i8** %dest, align 8, !dbg !124
  %5 = bitcast i8* %4 to i32*, !dbg !124
  %6 = load i8*, i8** %data.addr, align 8, !dbg !125
  %7 = bitcast i8* %6 to i32*, !dbg !125
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !126
  %8 = load i8*, i8** %dest, align 8, !dbg !127
  %9 = bitcast i8* %8 to i32*, !dbg !128
  call void @printWLine(i32* %9), !dbg !129
  ret void, !dbg !130
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !6, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
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
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_44_bad", scope: !19, file: !19, line: 38, type: !20, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_44.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 40, type: !4)
!23 = !DILocation(line: 40, column: 12, scope: !18)
!24 = !DILocalVariable(name: "funcPtr", scope: !18, file: !19, line: 42, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !4}
!28 = !DILocation(line: 42, column: 12, scope: !18)
!29 = !DILocation(line: 43, column: 10, scope: !18)
!30 = !DILocation(line: 45, column: 10, scope: !18)
!31 = !DILocation(line: 47, column: 5, scope: !18)
!32 = !DILocation(line: 47, column: 13, scope: !18)
!33 = !DILocation(line: 48, column: 1, scope: !18)
!34 = distinct !DISubprogram(name: "badSink", scope: !19, file: !19, line: 27, type: !26, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !19, line: 27, type: !4)
!36 = !DILocation(line: 27, column: 28, scope: !34)
!37 = !DILocalVariable(name: "dataLen", scope: !38, file: !19, line: 31, type: !39)
!38 = distinct !DILexicalBlock(scope: !34, file: !19, line: 29, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 31, column: 16, scope: !38)
!42 = !DILocation(line: 31, column: 41, scope: !38)
!43 = !DILocation(line: 31, column: 26, scope: !38)
!44 = !DILocalVariable(name: "dest", scope: !38, file: !19, line: 32, type: !4)
!45 = !DILocation(line: 32, column: 16, scope: !38)
!46 = !DILocation(line: 32, column: 31, scope: !38)
!47 = !DILocation(line: 33, column: 22, scope: !38)
!48 = !DILocation(line: 33, column: 28, scope: !38)
!49 = !DILocation(line: 33, column: 15, scope: !38)
!50 = !DILocation(line: 34, column: 27, scope: !38)
!51 = !DILocation(line: 34, column: 9, scope: !38)
!52 = !DILocation(line: 36, column: 1, scope: !34)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_44_good", scope: !19, file: !19, line: 98, type: !20, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 100, column: 5, scope: !53)
!55 = !DILocation(line: 101, column: 5, scope: !53)
!56 = !DILocation(line: 102, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 112, type: !58, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!11, !11, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !19, line: 112, type: !11)
!62 = !DILocation(line: 112, column: 14, scope: !57)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !19, line: 112, type: !60)
!64 = !DILocation(line: 112, column: 27, scope: !57)
!65 = !DILocation(line: 115, column: 22, scope: !57)
!66 = !DILocation(line: 115, column: 12, scope: !57)
!67 = !DILocation(line: 115, column: 5, scope: !57)
!68 = !DILocation(line: 117, column: 5, scope: !57)
!69 = !DILocation(line: 118, column: 5, scope: !57)
!70 = !DILocation(line: 119, column: 5, scope: !57)
!71 = !DILocation(line: 122, column: 5, scope: !57)
!72 = !DILocation(line: 123, column: 5, scope: !57)
!73 = !DILocation(line: 124, column: 5, scope: !57)
!74 = !DILocation(line: 126, column: 5, scope: !57)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 66, type: !20, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !19, line: 68, type: !4)
!77 = !DILocation(line: 68, column: 12, scope: !75)
!78 = !DILocalVariable(name: "funcPtr", scope: !75, file: !19, line: 69, type: !25)
!79 = !DILocation(line: 69, column: 12, scope: !75)
!80 = !DILocation(line: 70, column: 10, scope: !75)
!81 = !DILocation(line: 72, column: 10, scope: !75)
!82 = !DILocation(line: 73, column: 5, scope: !75)
!83 = !DILocation(line: 73, column: 13, scope: !75)
!84 = !DILocation(line: 74, column: 1, scope: !75)
!85 = distinct !DISubprogram(name: "goodG2BSink", scope: !19, file: !19, line: 55, type: !26, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", arg: 1, scope: !85, file: !19, line: 55, type: !4)
!87 = !DILocation(line: 55, column: 32, scope: !85)
!88 = !DILocalVariable(name: "dataLen", scope: !89, file: !19, line: 59, type: !39)
!89 = distinct !DILexicalBlock(scope: !85, file: !19, line: 57, column: 5)
!90 = !DILocation(line: 59, column: 16, scope: !89)
!91 = !DILocation(line: 59, column: 41, scope: !89)
!92 = !DILocation(line: 59, column: 26, scope: !89)
!93 = !DILocalVariable(name: "dest", scope: !89, file: !19, line: 60, type: !4)
!94 = !DILocation(line: 60, column: 16, scope: !89)
!95 = !DILocation(line: 60, column: 31, scope: !89)
!96 = !DILocation(line: 61, column: 22, scope: !89)
!97 = !DILocation(line: 61, column: 28, scope: !89)
!98 = !DILocation(line: 61, column: 15, scope: !89)
!99 = !DILocation(line: 62, column: 27, scope: !89)
!100 = !DILocation(line: 62, column: 9, scope: !89)
!101 = !DILocation(line: 64, column: 1, scope: !85)
!102 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 88, type: !20, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !19, line: 90, type: !4)
!104 = !DILocation(line: 90, column: 12, scope: !102)
!105 = !DILocalVariable(name: "funcPtr", scope: !102, file: !19, line: 91, type: !25)
!106 = !DILocation(line: 91, column: 12, scope: !102)
!107 = !DILocation(line: 92, column: 10, scope: !102)
!108 = !DILocation(line: 94, column: 10, scope: !102)
!109 = !DILocation(line: 95, column: 5, scope: !102)
!110 = !DILocation(line: 95, column: 13, scope: !102)
!111 = !DILocation(line: 96, column: 1, scope: !102)
!112 = distinct !DISubprogram(name: "goodB2GSink", scope: !19, file: !19, line: 77, type: !26, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", arg: 1, scope: !112, file: !19, line: 77, type: !4)
!114 = !DILocation(line: 77, column: 32, scope: !112)
!115 = !DILocalVariable(name: "dataLen", scope: !116, file: !19, line: 81, type: !39)
!116 = distinct !DILexicalBlock(scope: !112, file: !19, line: 79, column: 5)
!117 = !DILocation(line: 81, column: 16, scope: !116)
!118 = !DILocation(line: 81, column: 44, scope: !116)
!119 = !DILocation(line: 81, column: 33, scope: !116)
!120 = !DILocation(line: 81, column: 26, scope: !116)
!121 = !DILocalVariable(name: "dest", scope: !116, file: !19, line: 82, type: !4)
!122 = !DILocation(line: 82, column: 16, scope: !116)
!123 = !DILocation(line: 82, column: 31, scope: !116)
!124 = !DILocation(line: 83, column: 22, scope: !116)
!125 = !DILocation(line: 83, column: 28, scope: !116)
!126 = !DILocation(line: 83, column: 15, scope: !116)
!127 = !DILocation(line: 84, column: 31, scope: !116)
!128 = !DILocation(line: 84, column: 20, scope: !116)
!129 = !DILocation(line: 84, column: 9, scope: !116)
!130 = !DILocation(line: 86, column: 1, scope: !112)
