; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_12.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_12_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call1, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !34
  store i32* %add.ptr, i32** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  store i32* %5, i32** %data, align 8, !dbg !39
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !47
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx3, align 4, !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call5 = call i32* @wcscpy(i32* %6, i32* %arraydecay4) #4, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %7), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_12_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #4, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #4, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_12_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_12_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 400, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !87
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !90
  %tobool = icmp ne i32 %call1, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  store i32* %4, i32** %data, align 8, !dbg !95
  br label %if.end, !dbg !96

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  store i32* %5, i32** %data, align 8, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !104
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx3, align 4, !dbg !106
  %6 = load i32*, i32** %data, align 8, !dbg !107
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call5 = call i32* @wcscpy(i32* %6, i32* %arraydecay4) #4, !dbg !109
  %7 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %7), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_12_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 29, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 8)
!31 = !DILocation(line: 29, column: 8, scope: !15)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 30, column: 5)
!34 = !DILocation(line: 32, column: 27, scope: !33)
!35 = !DILocation(line: 32, column: 14, scope: !33)
!36 = !DILocation(line: 33, column: 5, scope: !33)
!37 = !DILocation(line: 37, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !16, line: 35, column: 5)
!39 = !DILocation(line: 37, column: 14, scope: !38)
!40 = !DILocalVariable(name: "source", scope: !41, file: !16, line: 40, type: !42)
!41 = distinct !DILexicalBlock(scope: !15, file: !16, line: 39, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 40, column: 17, scope: !41)
!46 = !DILocation(line: 41, column: 17, scope: !41)
!47 = !DILocation(line: 41, column: 9, scope: !41)
!48 = !DILocation(line: 42, column: 9, scope: !41)
!49 = !DILocation(line: 42, column: 23, scope: !41)
!50 = !DILocation(line: 44, column: 16, scope: !41)
!51 = !DILocation(line: 44, column: 22, scope: !41)
!52 = !DILocation(line: 44, column: 9, scope: !41)
!53 = !DILocation(line: 45, column: 20, scope: !41)
!54 = !DILocation(line: 45, column: 9, scope: !41)
!55 = !DILocation(line: 47, column: 1, scope: !15)
!56 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_12_good", scope: !16, file: !16, line: 81, type: !17, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 83, column: 5, scope: !56)
!58 = !DILocation(line: 84, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 96, type: !60, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !16, line: 96, type: !7)
!66 = !DILocation(line: 96, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !16, line: 96, type: !62)
!68 = !DILocation(line: 96, column: 27, scope: !59)
!69 = !DILocation(line: 99, column: 22, scope: !59)
!70 = !DILocation(line: 99, column: 12, scope: !59)
!71 = !DILocation(line: 99, column: 5, scope: !59)
!72 = !DILocation(line: 101, column: 5, scope: !59)
!73 = !DILocation(line: 102, column: 5, scope: !59)
!74 = !DILocation(line: 103, column: 5, scope: !59)
!75 = !DILocation(line: 106, column: 5, scope: !59)
!76 = !DILocation(line: 107, column: 5, scope: !59)
!77 = !DILocation(line: 108, column: 5, scope: !59)
!78 = !DILocation(line: 110, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !16, line: 57, type: !4)
!81 = !DILocation(line: 57, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !16, line: 58, type: !4)
!83 = !DILocation(line: 58, column: 15, scope: !79)
!84 = !DILocation(line: 58, column: 39, scope: !79)
!85 = !DILocation(line: 58, column: 28, scope: !79)
!86 = !DILocation(line: 59, column: 13, scope: !79)
!87 = !DILocation(line: 59, column: 5, scope: !79)
!88 = !DILocation(line: 60, column: 5, scope: !79)
!89 = !DILocation(line: 60, column: 23, scope: !79)
!90 = !DILocation(line: 61, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !79, file: !16, line: 61, column: 8)
!92 = !DILocation(line: 61, column: 8, scope: !79)
!93 = !DILocation(line: 64, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !16, line: 62, column: 5)
!95 = !DILocation(line: 64, column: 14, scope: !94)
!96 = !DILocation(line: 65, column: 5, scope: !94)
!97 = !DILocation(line: 69, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !16, line: 67, column: 5)
!99 = !DILocation(line: 69, column: 14, scope: !98)
!100 = !DILocalVariable(name: "source", scope: !101, file: !16, line: 72, type: !42)
!101 = distinct !DILexicalBlock(scope: !79, file: !16, line: 71, column: 5)
!102 = !DILocation(line: 72, column: 17, scope: !101)
!103 = !DILocation(line: 73, column: 17, scope: !101)
!104 = !DILocation(line: 73, column: 9, scope: !101)
!105 = !DILocation(line: 74, column: 9, scope: !101)
!106 = !DILocation(line: 74, column: 23, scope: !101)
!107 = !DILocation(line: 76, column: 16, scope: !101)
!108 = !DILocation(line: 76, column: 22, scope: !101)
!109 = !DILocation(line: 76, column: 9, scope: !101)
!110 = !DILocation(line: 77, column: 20, scope: !101)
!111 = !DILocation(line: 77, column: 9, scope: !101)
!112 = !DILocation(line: 79, column: 1, scope: !79)
