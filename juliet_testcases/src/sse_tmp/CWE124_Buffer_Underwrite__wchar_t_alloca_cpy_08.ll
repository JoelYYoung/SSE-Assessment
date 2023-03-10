; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_08_bad() #0 !dbg !15 {
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
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #4, !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %6), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_08_good() #0 !dbg !53 {
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
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_08_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_08_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !77 {
entry:
  ret i32 1, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 400, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBuffer, align 8, !dbg !85
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !89
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %call1 = call i32 @staticReturnsFalse(), !dbg !92
  %tobool = icmp ne i32 %call1, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  store i32* %4, i32** %data, align 8, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !104
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !105
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx3, align 4, !dbg !107
  %5 = load i32*, i32** %data, align 8, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #4, !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* %6), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !114 {
entry:
  ret i32 0, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 400, align 16, !dbg !121
  %1 = bitcast i8* %0 to i32*, !dbg !122
  store i32* %1, i32** %dataBuffer, align 8, !dbg !120
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !123
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !124
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  %call1 = call i32 @staticReturnsTrue(), !dbg !127
  %tobool = icmp ne i32 %call1, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !130
  store i32* %4, i32** %data, align 8, !dbg !132
  br label %if.end, !dbg !133

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !137
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !138
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !139
  store i32 0, i32* %arrayidx3, align 4, !dbg !140
  %5 = load i32*, i32** %data, align 8, !dbg !141
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !142
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #4, !dbg !143
  %6 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* %6), !dbg !145
  ret void, !dbg !146
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!47 = !DILocation(line: 53, column: 16, scope: !38)
!48 = !DILocation(line: 53, column: 22, scope: !38)
!49 = !DILocation(line: 53, column: 9, scope: !38)
!50 = !DILocation(line: 54, column: 20, scope: !38)
!51 = !DILocation(line: 54, column: 9, scope: !38)
!52 = !DILocation(line: 56, column: 1, scope: !15)
!53 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_08_good", scope: !16, file: !16, line: 111, type: !17, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 113, column: 5, scope: !53)
!55 = !DILocation(line: 114, column: 5, scope: !53)
!56 = !DILocation(line: 115, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 127, type: !58, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !16, line: 127, type: !7)
!64 = !DILocation(line: 127, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !16, line: 127, type: !60)
!66 = !DILocation(line: 127, column: 27, scope: !57)
!67 = !DILocation(line: 130, column: 22, scope: !57)
!68 = !DILocation(line: 130, column: 12, scope: !57)
!69 = !DILocation(line: 130, column: 5, scope: !57)
!70 = !DILocation(line: 132, column: 5, scope: !57)
!71 = !DILocation(line: 133, column: 5, scope: !57)
!72 = !DILocation(line: 134, column: 5, scope: !57)
!73 = !DILocation(line: 137, column: 5, scope: !57)
!74 = !DILocation(line: 138, column: 5, scope: !57)
!75 = !DILocation(line: 139, column: 5, scope: !57)
!76 = !DILocation(line: 141, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !78, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7}
!80 = !DILocation(line: 27, column: 5, scope: !77)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 63, type: !17, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !16, line: 65, type: !4)
!83 = !DILocation(line: 65, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !16, line: 66, type: !4)
!85 = !DILocation(line: 66, column: 15, scope: !81)
!86 = !DILocation(line: 66, column: 39, scope: !81)
!87 = !DILocation(line: 66, column: 28, scope: !81)
!88 = !DILocation(line: 67, column: 13, scope: !81)
!89 = !DILocation(line: 67, column: 5, scope: !81)
!90 = !DILocation(line: 68, column: 5, scope: !81)
!91 = !DILocation(line: 68, column: 23, scope: !81)
!92 = !DILocation(line: 69, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !16, line: 69, column: 8)
!94 = !DILocation(line: 69, column: 8, scope: !81)
!95 = !DILocation(line: 72, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !16, line: 70, column: 5)
!97 = !DILocation(line: 73, column: 5, scope: !96)
!98 = !DILocation(line: 77, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !16, line: 75, column: 5)
!100 = !DILocation(line: 77, column: 14, scope: !99)
!101 = !DILocalVariable(name: "source", scope: !102, file: !16, line: 80, type: !39)
!102 = distinct !DILexicalBlock(scope: !81, file: !16, line: 79, column: 5)
!103 = !DILocation(line: 80, column: 17, scope: !102)
!104 = !DILocation(line: 81, column: 17, scope: !102)
!105 = !DILocation(line: 81, column: 9, scope: !102)
!106 = !DILocation(line: 82, column: 9, scope: !102)
!107 = !DILocation(line: 82, column: 23, scope: !102)
!108 = !DILocation(line: 84, column: 16, scope: !102)
!109 = !DILocation(line: 84, column: 22, scope: !102)
!110 = !DILocation(line: 84, column: 9, scope: !102)
!111 = !DILocation(line: 85, column: 20, scope: !102)
!112 = !DILocation(line: 85, column: 9, scope: !102)
!113 = !DILocation(line: 87, column: 1, scope: !81)
!114 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !78, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocation(line: 32, column: 5, scope: !114)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 90, type: !17, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !16, line: 92, type: !4)
!118 = !DILocation(line: 92, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBuffer", scope: !116, file: !16, line: 93, type: !4)
!120 = !DILocation(line: 93, column: 15, scope: !116)
!121 = !DILocation(line: 93, column: 39, scope: !116)
!122 = !DILocation(line: 93, column: 28, scope: !116)
!123 = !DILocation(line: 94, column: 13, scope: !116)
!124 = !DILocation(line: 94, column: 5, scope: !116)
!125 = !DILocation(line: 95, column: 5, scope: !116)
!126 = !DILocation(line: 95, column: 23, scope: !116)
!127 = !DILocation(line: 96, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !16, line: 96, column: 8)
!129 = !DILocation(line: 96, column: 8, scope: !116)
!130 = !DILocation(line: 99, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !16, line: 97, column: 5)
!132 = !DILocation(line: 99, column: 14, scope: !131)
!133 = !DILocation(line: 100, column: 5, scope: !131)
!134 = !DILocalVariable(name: "source", scope: !135, file: !16, line: 102, type: !39)
!135 = distinct !DILexicalBlock(scope: !116, file: !16, line: 101, column: 5)
!136 = !DILocation(line: 102, column: 17, scope: !135)
!137 = !DILocation(line: 103, column: 17, scope: !135)
!138 = !DILocation(line: 103, column: 9, scope: !135)
!139 = !DILocation(line: 104, column: 9, scope: !135)
!140 = !DILocation(line: 104, column: 23, scope: !135)
!141 = !DILocation(line: 106, column: 16, scope: !135)
!142 = !DILocation(line: 106, column: 22, scope: !135)
!143 = !DILocation(line: 106, column: 9, scope: !135)
!144 = !DILocation(line: 107, column: 20, scope: !135)
!145 = !DILocation(line: 107, column: 9, scope: !135)
!146 = !DILocation(line: 109, column: 1, scope: !116)
