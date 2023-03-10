; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_11.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_11_bad() #0 !dbg !15 {
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
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call1, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !34
  store i32* %add.ptr, i32** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #4, !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %6), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local i32 @globalReturnsTrue(...) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_11_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #4, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #4, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_11_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_11_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 400, align 16, !dbg !82
  %1 = bitcast i8* %0 to i32*, !dbg !83
  store i32* %1, i32** %dataBuffer, align 8, !dbg !81
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !84
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !85
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !88
  %tobool = icmp ne i32 %call1, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  store i32* %4, i32** %data, align 8, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !101
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx3, align 4, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !104
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #4, !dbg !106
  %6 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %6), !dbg !108
  ret void, !dbg !109
}

declare dso_local i32 @globalReturnsFalse(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 400, align 16, !dbg !115
  %1 = bitcast i8* %0 to i32*, !dbg !116
  store i32* %1, i32** %dataBuffer, align 8, !dbg !114
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !118
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !121
  %tobool = icmp ne i32 %call1, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  store i32* %4, i32** %data, align 8, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !131
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !132
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx3, align 4, !dbg !134
  %5 = load i32*, i32** %data, align 8, !dbg !135
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !136
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #4, !dbg !137
  %6 = load i32*, i32** %data, align 8, !dbg !138
  call void @printWLine(i32* %6), !dbg !139
  ret void, !dbg !140
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_11_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!37 = !DILocalVariable(name: "source", scope: !38, file: !16, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 35, column: 17, scope: !38)
!43 = !DILocation(line: 36, column: 17, scope: !38)
!44 = !DILocation(line: 36, column: 9, scope: !38)
!45 = !DILocation(line: 37, column: 9, scope: !38)
!46 = !DILocation(line: 37, column: 23, scope: !38)
!47 = !DILocation(line: 39, column: 16, scope: !38)
!48 = !DILocation(line: 39, column: 22, scope: !38)
!49 = !DILocation(line: 39, column: 9, scope: !38)
!50 = !DILocation(line: 40, column: 20, scope: !38)
!51 = !DILocation(line: 40, column: 9, scope: !38)
!52 = !DILocation(line: 42, column: 1, scope: !15)
!53 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_11_good", scope: !16, file: !16, line: 97, type: !17, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 99, column: 5, scope: !53)
!55 = !DILocation(line: 100, column: 5, scope: !53)
!56 = !DILocation(line: 101, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 113, type: !58, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !16, line: 113, type: !7)
!64 = !DILocation(line: 113, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !16, line: 113, type: !60)
!66 = !DILocation(line: 113, column: 27, scope: !57)
!67 = !DILocation(line: 116, column: 22, scope: !57)
!68 = !DILocation(line: 116, column: 12, scope: !57)
!69 = !DILocation(line: 116, column: 5, scope: !57)
!70 = !DILocation(line: 118, column: 5, scope: !57)
!71 = !DILocation(line: 119, column: 5, scope: !57)
!72 = !DILocation(line: 120, column: 5, scope: !57)
!73 = !DILocation(line: 123, column: 5, scope: !57)
!74 = !DILocation(line: 124, column: 5, scope: !57)
!75 = !DILocation(line: 125, column: 5, scope: !57)
!76 = !DILocation(line: 127, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 49, type: !17, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !16, line: 51, type: !4)
!79 = !DILocation(line: 51, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !16, line: 52, type: !4)
!81 = !DILocation(line: 52, column: 15, scope: !77)
!82 = !DILocation(line: 52, column: 39, scope: !77)
!83 = !DILocation(line: 52, column: 28, scope: !77)
!84 = !DILocation(line: 53, column: 13, scope: !77)
!85 = !DILocation(line: 53, column: 5, scope: !77)
!86 = !DILocation(line: 54, column: 5, scope: !77)
!87 = !DILocation(line: 54, column: 23, scope: !77)
!88 = !DILocation(line: 55, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !77, file: !16, line: 55, column: 8)
!90 = !DILocation(line: 55, column: 8, scope: !77)
!91 = !DILocation(line: 58, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !16, line: 56, column: 5)
!93 = !DILocation(line: 59, column: 5, scope: !92)
!94 = !DILocation(line: 63, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !16, line: 61, column: 5)
!96 = !DILocation(line: 63, column: 14, scope: !95)
!97 = !DILocalVariable(name: "source", scope: !98, file: !16, line: 66, type: !39)
!98 = distinct !DILexicalBlock(scope: !77, file: !16, line: 65, column: 5)
!99 = !DILocation(line: 66, column: 17, scope: !98)
!100 = !DILocation(line: 67, column: 17, scope: !98)
!101 = !DILocation(line: 67, column: 9, scope: !98)
!102 = !DILocation(line: 68, column: 9, scope: !98)
!103 = !DILocation(line: 68, column: 23, scope: !98)
!104 = !DILocation(line: 70, column: 16, scope: !98)
!105 = !DILocation(line: 70, column: 22, scope: !98)
!106 = !DILocation(line: 70, column: 9, scope: !98)
!107 = !DILocation(line: 71, column: 20, scope: !98)
!108 = !DILocation(line: 71, column: 9, scope: !98)
!109 = !DILocation(line: 73, column: 1, scope: !77)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 76, type: !17, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !16, line: 78, type: !4)
!112 = !DILocation(line: 78, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !16, line: 79, type: !4)
!114 = !DILocation(line: 79, column: 15, scope: !110)
!115 = !DILocation(line: 79, column: 39, scope: !110)
!116 = !DILocation(line: 79, column: 28, scope: !110)
!117 = !DILocation(line: 80, column: 13, scope: !110)
!118 = !DILocation(line: 80, column: 5, scope: !110)
!119 = !DILocation(line: 81, column: 5, scope: !110)
!120 = !DILocation(line: 81, column: 23, scope: !110)
!121 = !DILocation(line: 82, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !110, file: !16, line: 82, column: 8)
!123 = !DILocation(line: 82, column: 8, scope: !110)
!124 = !DILocation(line: 85, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !16, line: 83, column: 5)
!126 = !DILocation(line: 85, column: 14, scope: !125)
!127 = !DILocation(line: 86, column: 5, scope: !125)
!128 = !DILocalVariable(name: "source", scope: !129, file: !16, line: 88, type: !39)
!129 = distinct !DILexicalBlock(scope: !110, file: !16, line: 87, column: 5)
!130 = !DILocation(line: 88, column: 17, scope: !129)
!131 = !DILocation(line: 89, column: 17, scope: !129)
!132 = !DILocation(line: 89, column: 9, scope: !129)
!133 = !DILocation(line: 90, column: 9, scope: !129)
!134 = !DILocation(line: 90, column: 23, scope: !129)
!135 = !DILocation(line: 92, column: 16, scope: !129)
!136 = !DILocation(line: 92, column: 22, scope: !129)
!137 = !DILocation(line: 92, column: 9, scope: !129)
!138 = !DILocation(line: 93, column: 20, scope: !129)
!139 = !DILocation(line: 93, column: 9, scope: !129)
!140 = !DILocation(line: 95, column: 1, scope: !110)
