; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_08_bad() #0 !dbg !15 {
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
  %call1 = call i32 @staticReturnsTrue(), !dbg !29
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
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #4, !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !50
  store i32 0, i32* %arrayidx6, align 4, !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %7), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_08_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
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
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_08_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_08_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !79 {
entry:
  ret i32 1, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 400, align 16, !dbg !88
  %1 = bitcast i8* %0 to i32*, !dbg !89
  store i32* %1, i32** %dataBuffer, align 8, !dbg !87
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !91
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  %call1 = call i32 @staticReturnsFalse(), !dbg !94
  %tobool = icmp ne i32 %call1, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end, !dbg !99

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  store i32* %4, i32** %data, align 8, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !107
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx3, align 4, !dbg !109
  %5 = load i32*, i32** %data, align 8, !dbg !110
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #4, !dbg !112
  %6 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !113
  store i32 0, i32* %arrayidx6, align 4, !dbg !114
  %7 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %7), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !118 {
entry:
  ret i32 0, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = alloca i8, i64 400, align 16, !dbg !125
  %1 = bitcast i8* %0 to i32*, !dbg !126
  store i32* %1, i32** %dataBuffer, align 8, !dbg !124
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !127
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !128
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  %call1 = call i32 @staticReturnsTrue(), !dbg !131
  %tobool = icmp ne i32 %call1, 0, !dbg !131
  br i1 %tobool, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  store i32* %4, i32** %data, align 8, !dbg !136
  br label %if.end, !dbg !137

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !138, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !141
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !142
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !143
  store i32 0, i32* %arrayidx3, align 4, !dbg !144
  %5 = load i32*, i32** %data, align 8, !dbg !145
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #4, !dbg !147
  %6 = load i32*, i32** %data, align 8, !dbg !148
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !148
  store i32 0, i32* %arrayidx6, align 4, !dbg !149
  %7 = load i32*, i32** %data, align 8, !dbg !150
  call void @printWLine(i32* %7), !dbg !151
  ret void, !dbg !152
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 39, scope: !15)
!24 = !DILocation(line: 40, column: 28, scope: !15)
!25 = !DILocation(line: 41, column: 13, scope: !15)
!26 = !DILocation(line: 41, column: 5, scope: !15)
!27 = !DILocation(line: 42, column: 5, scope: !15)
!28 = !DILocation(line: 42, column: 23, scope: !15)
!29 = !DILocation(line: 43, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 43, column: 8)
!31 = !DILocation(line: 43, column: 8, scope: !15)
!32 = !DILocation(line: 46, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 44, column: 5)
!34 = !DILocation(line: 46, column: 27, scope: !33)
!35 = !DILocation(line: 46, column: 14, scope: !33)
!36 = !DILocation(line: 47, column: 5, scope: !33)
!37 = !DILocalVariable(name: "source", scope: !38, file: !16, line: 49, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 48, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 49, column: 17, scope: !38)
!43 = !DILocation(line: 50, column: 17, scope: !38)
!44 = !DILocation(line: 50, column: 9, scope: !38)
!45 = !DILocation(line: 51, column: 9, scope: !38)
!46 = !DILocation(line: 51, column: 23, scope: !38)
!47 = !DILocation(line: 53, column: 17, scope: !38)
!48 = !DILocation(line: 53, column: 23, scope: !38)
!49 = !DILocation(line: 53, column: 9, scope: !38)
!50 = !DILocation(line: 55, column: 9, scope: !38)
!51 = !DILocation(line: 55, column: 21, scope: !38)
!52 = !DILocation(line: 56, column: 20, scope: !38)
!53 = !DILocation(line: 56, column: 9, scope: !38)
!54 = !DILocation(line: 58, column: 1, scope: !15)
!55 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_08_good", scope: !16, file: !16, line: 117, type: !17, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 119, column: 5, scope: !55)
!57 = !DILocation(line: 120, column: 5, scope: !55)
!58 = !DILocation(line: 121, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 133, type: !60, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !16, line: 133, type: !7)
!66 = !DILocation(line: 133, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !16, line: 133, type: !62)
!68 = !DILocation(line: 133, column: 27, scope: !59)
!69 = !DILocation(line: 136, column: 22, scope: !59)
!70 = !DILocation(line: 136, column: 12, scope: !59)
!71 = !DILocation(line: 136, column: 5, scope: !59)
!72 = !DILocation(line: 138, column: 5, scope: !59)
!73 = !DILocation(line: 139, column: 5, scope: !59)
!74 = !DILocation(line: 140, column: 5, scope: !59)
!75 = !DILocation(line: 143, column: 5, scope: !59)
!76 = !DILocation(line: 144, column: 5, scope: !59)
!77 = !DILocation(line: 145, column: 5, scope: !59)
!78 = !DILocation(line: 147, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !80, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!7}
!82 = !DILocation(line: 27, column: 5, scope: !79)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !16, line: 67, type: !4)
!85 = !DILocation(line: 67, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !16, line: 68, type: !4)
!87 = !DILocation(line: 68, column: 15, scope: !83)
!88 = !DILocation(line: 68, column: 39, scope: !83)
!89 = !DILocation(line: 68, column: 28, scope: !83)
!90 = !DILocation(line: 69, column: 13, scope: !83)
!91 = !DILocation(line: 69, column: 5, scope: !83)
!92 = !DILocation(line: 70, column: 5, scope: !83)
!93 = !DILocation(line: 70, column: 23, scope: !83)
!94 = !DILocation(line: 71, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !16, line: 71, column: 8)
!96 = !DILocation(line: 71, column: 8, scope: !83)
!97 = !DILocation(line: 74, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !16, line: 72, column: 5)
!99 = !DILocation(line: 75, column: 5, scope: !98)
!100 = !DILocation(line: 79, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !16, line: 77, column: 5)
!102 = !DILocation(line: 79, column: 14, scope: !101)
!103 = !DILocalVariable(name: "source", scope: !104, file: !16, line: 82, type: !39)
!104 = distinct !DILexicalBlock(scope: !83, file: !16, line: 81, column: 5)
!105 = !DILocation(line: 82, column: 17, scope: !104)
!106 = !DILocation(line: 83, column: 17, scope: !104)
!107 = !DILocation(line: 83, column: 9, scope: !104)
!108 = !DILocation(line: 84, column: 9, scope: !104)
!109 = !DILocation(line: 84, column: 23, scope: !104)
!110 = !DILocation(line: 86, column: 17, scope: !104)
!111 = !DILocation(line: 86, column: 23, scope: !104)
!112 = !DILocation(line: 86, column: 9, scope: !104)
!113 = !DILocation(line: 88, column: 9, scope: !104)
!114 = !DILocation(line: 88, column: 21, scope: !104)
!115 = !DILocation(line: 89, column: 20, scope: !104)
!116 = !DILocation(line: 89, column: 9, scope: !104)
!117 = !DILocation(line: 91, column: 1, scope: !83)
!118 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !80, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocation(line: 32, column: 5, scope: !118)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !16, line: 96, type: !4)
!122 = !DILocation(line: 96, column: 15, scope: !120)
!123 = !DILocalVariable(name: "dataBuffer", scope: !120, file: !16, line: 97, type: !4)
!124 = !DILocation(line: 97, column: 15, scope: !120)
!125 = !DILocation(line: 97, column: 39, scope: !120)
!126 = !DILocation(line: 97, column: 28, scope: !120)
!127 = !DILocation(line: 98, column: 13, scope: !120)
!128 = !DILocation(line: 98, column: 5, scope: !120)
!129 = !DILocation(line: 99, column: 5, scope: !120)
!130 = !DILocation(line: 99, column: 23, scope: !120)
!131 = !DILocation(line: 100, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !120, file: !16, line: 100, column: 8)
!133 = !DILocation(line: 100, column: 8, scope: !120)
!134 = !DILocation(line: 103, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !16, line: 101, column: 5)
!136 = !DILocation(line: 103, column: 14, scope: !135)
!137 = !DILocation(line: 104, column: 5, scope: !135)
!138 = !DILocalVariable(name: "source", scope: !139, file: !16, line: 106, type: !39)
!139 = distinct !DILexicalBlock(scope: !120, file: !16, line: 105, column: 5)
!140 = !DILocation(line: 106, column: 17, scope: !139)
!141 = !DILocation(line: 107, column: 17, scope: !139)
!142 = !DILocation(line: 107, column: 9, scope: !139)
!143 = !DILocation(line: 108, column: 9, scope: !139)
!144 = !DILocation(line: 108, column: 23, scope: !139)
!145 = !DILocation(line: 110, column: 17, scope: !139)
!146 = !DILocation(line: 110, column: 23, scope: !139)
!147 = !DILocation(line: 110, column: 9, scope: !139)
!148 = !DILocation(line: 112, column: 9, scope: !139)
!149 = !DILocation(line: 112, column: 21, scope: !139)
!150 = !DILocation(line: 113, column: 20, scope: !139)
!151 = !DILocation(line: 113, column: 9, scope: !139)
!152 = !DILocation(line: 115, column: 1, scope: !120)
