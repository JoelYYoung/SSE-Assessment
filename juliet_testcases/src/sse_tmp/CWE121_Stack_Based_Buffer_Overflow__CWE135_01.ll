; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_01_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !26, metadata !DIExpression()), !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %call = call i64 @strlen(i8* %0) #5, !dbg !32
  store i64 %call, i64* %dataLen, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !33, metadata !DIExpression()), !dbg !34
  %1 = load i64, i64* %dataLen, align 8, !dbg !35
  %add = add i64 %1, 1, !dbg !35
  %mul = mul i64 %add, 4, !dbg !35
  %2 = alloca i8, i64 %mul, align 16, !dbg !35
  store i8* %2, i8** %dest, align 8, !dbg !34
  %3 = load i8*, i8** %dest, align 8, !dbg !36
  %4 = bitcast i8* %3 to i32*, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  %6 = bitcast i8* %5 to i32*, !dbg !37
  %call1 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !38
  %7 = load i8*, i8** %dest, align 8, !dbg !39
  call void @printLine(i8* %7), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_01_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  call void @goodB2G(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #6, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #6, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_01_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_01_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i8* null, i8** %data, align 8, !dbg !67
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !69, metadata !DIExpression()), !dbg !71
  %0 = load i8*, i8** %data, align 8, !dbg !72
  %call = call i64 @strlen(i8* %0) #5, !dbg !73
  store i64 %call, i64* %dataLen, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !74, metadata !DIExpression()), !dbg !75
  %1 = load i64, i64* %dataLen, align 8, !dbg !76
  %add = add i64 %1, 1, !dbg !76
  %mul = mul i64 %add, 1, !dbg !76
  %2 = alloca i8, i64 %mul, align 16, !dbg !76
  store i8* %2, i8** %dest, align 8, !dbg !75
  %3 = load i8*, i8** %dest, align 8, !dbg !77
  %4 = load i8*, i8** %data, align 8, !dbg !78
  %call1 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !79
  %5 = load i8*, i8** %dest, align 8, !dbg !80
  call void @printLine(i8* %5), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i8* null, i8** %data, align 8, !dbg !86
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !88, metadata !DIExpression()), !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %1 = bitcast i8* %0 to i32*, !dbg !92
  %call = call i64 @wcslen(i32* %1) #5, !dbg !93
  store i64 %call, i64* %dataLen, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !94, metadata !DIExpression()), !dbg !95
  %2 = load i64, i64* %dataLen, align 8, !dbg !96
  %add = add i64 %2, 1, !dbg !96
  %mul = mul i64 %add, 4, !dbg !96
  %3 = alloca i8, i64 %mul, align 16, !dbg !96
  store i8* %3, i8** %dest, align 8, !dbg !95
  %4 = load i8*, i8** %dest, align 8, !dbg !97
  %5 = bitcast i8* %4 to i32*, !dbg !97
  %6 = load i8*, i8** %data, align 8, !dbg !98
  %7 = bitcast i8* %6 to i32*, !dbg !98
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !99
  %8 = load i8*, i8** %dest, align 8, !dbg !100
  %9 = bitcast i8* %8 to i32*, !dbg !101
  call void @printWLine(i32* %9), !dbg !102
  ret void, !dbg !103
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_01_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_01.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocation(line: 30, column: 10, scope: !18)
!25 = !DILocation(line: 32, column: 10, scope: !18)
!26 = !DILocalVariable(name: "dataLen", scope: !27, file: !19, line: 35, type: !28)
!27 = distinct !DILexicalBlock(scope: !18, file: !19, line: 33, column: 5)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !29)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 35, column: 16, scope: !27)
!31 = !DILocation(line: 35, column: 41, scope: !27)
!32 = !DILocation(line: 35, column: 26, scope: !27)
!33 = !DILocalVariable(name: "dest", scope: !27, file: !19, line: 36, type: !4)
!34 = !DILocation(line: 36, column: 16, scope: !27)
!35 = !DILocation(line: 36, column: 31, scope: !27)
!36 = !DILocation(line: 37, column: 22, scope: !27)
!37 = !DILocation(line: 37, column: 28, scope: !27)
!38 = !DILocation(line: 37, column: 15, scope: !27)
!39 = !DILocation(line: 38, column: 27, scope: !27)
!40 = !DILocation(line: 38, column: 9, scope: !27)
!41 = !DILocation(line: 40, column: 1, scope: !18)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_01_good", scope: !19, file: !19, line: 78, type: !20, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 80, column: 5, scope: !42)
!44 = !DILocation(line: 81, column: 5, scope: !42)
!45 = !DILocation(line: 82, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 93, type: !47, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!11, !11, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !19, line: 93, type: !11)
!51 = !DILocation(line: 93, column: 14, scope: !46)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !19, line: 93, type: !49)
!53 = !DILocation(line: 93, column: 27, scope: !46)
!54 = !DILocation(line: 96, column: 22, scope: !46)
!55 = !DILocation(line: 96, column: 12, scope: !46)
!56 = !DILocation(line: 96, column: 5, scope: !46)
!57 = !DILocation(line: 98, column: 5, scope: !46)
!58 = !DILocation(line: 99, column: 5, scope: !46)
!59 = !DILocation(line: 100, column: 5, scope: !46)
!60 = !DILocation(line: 103, column: 5, scope: !46)
!61 = !DILocation(line: 104, column: 5, scope: !46)
!62 = !DILocation(line: 105, column: 5, scope: !46)
!63 = !DILocation(line: 107, column: 5, scope: !46)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 47, type: !20, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !19, line: 49, type: !4)
!66 = !DILocation(line: 49, column: 12, scope: !64)
!67 = !DILocation(line: 50, column: 10, scope: !64)
!68 = !DILocation(line: 52, column: 10, scope: !64)
!69 = !DILocalVariable(name: "dataLen", scope: !70, file: !19, line: 55, type: !28)
!70 = distinct !DILexicalBlock(scope: !64, file: !19, line: 53, column: 5)
!71 = !DILocation(line: 55, column: 16, scope: !70)
!72 = !DILocation(line: 55, column: 41, scope: !70)
!73 = !DILocation(line: 55, column: 26, scope: !70)
!74 = !DILocalVariable(name: "dest", scope: !70, file: !19, line: 56, type: !4)
!75 = !DILocation(line: 56, column: 16, scope: !70)
!76 = !DILocation(line: 56, column: 31, scope: !70)
!77 = !DILocation(line: 57, column: 22, scope: !70)
!78 = !DILocation(line: 57, column: 28, scope: !70)
!79 = !DILocation(line: 57, column: 15, scope: !70)
!80 = !DILocation(line: 58, column: 27, scope: !70)
!81 = !DILocation(line: 58, column: 9, scope: !70)
!82 = !DILocation(line: 60, column: 1, scope: !64)
!83 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !19, line: 65, type: !4)
!85 = !DILocation(line: 65, column: 12, scope: !83)
!86 = !DILocation(line: 66, column: 10, scope: !83)
!87 = !DILocation(line: 68, column: 10, scope: !83)
!88 = !DILocalVariable(name: "dataLen", scope: !89, file: !19, line: 71, type: !28)
!89 = distinct !DILexicalBlock(scope: !83, file: !19, line: 69, column: 5)
!90 = !DILocation(line: 71, column: 16, scope: !89)
!91 = !DILocation(line: 71, column: 44, scope: !89)
!92 = !DILocation(line: 71, column: 33, scope: !89)
!93 = !DILocation(line: 71, column: 26, scope: !89)
!94 = !DILocalVariable(name: "dest", scope: !89, file: !19, line: 72, type: !4)
!95 = !DILocation(line: 72, column: 16, scope: !89)
!96 = !DILocation(line: 72, column: 31, scope: !89)
!97 = !DILocation(line: 73, column: 22, scope: !89)
!98 = !DILocation(line: 73, column: 28, scope: !89)
!99 = !DILocation(line: 73, column: 15, scope: !89)
!100 = !DILocation(line: 74, column: 31, scope: !89)
!101 = !DILocation(line: 74, column: 20, scope: !89)
!102 = !DILocation(line: 74, column: 9, scope: !89)
!103 = !DILocation(line: 76, column: 1, scope: !83)
