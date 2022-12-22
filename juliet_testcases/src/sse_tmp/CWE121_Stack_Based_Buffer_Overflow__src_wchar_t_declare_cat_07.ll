; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #5, !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %4 = load i32*, i32** %data, align 8, !dbg !48
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %4) #5, !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %5), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_07_good() #0 !dbg !53 {
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
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_07_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_07_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i32* %arraydecay, i32** %data, align 8, !dbg !83
  %0 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp ne i32 %0, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #5, !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !98
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !99
  %4 = load i32*, i32** %data, align 8, !dbg !100
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %4) #5, !dbg !101
  %5 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %5), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay, i32** %data, align 8, !dbg !111
  %0 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp eq i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #5, !dbg !118
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !124
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !125
  %4 = load i32*, i32** %data, align 8, !dbg !126
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %4) #5, !dbg !127
  %5 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* %5), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocation(line: 33, column: 12, scope: !16)
!30 = !DILocation(line: 33, column: 10, scope: !16)
!31 = !DILocation(line: 34, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!33 = !DILocation(line: 34, column: 18, scope: !32)
!34 = !DILocation(line: 34, column: 8, scope: !16)
!35 = !DILocation(line: 37, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 35, column: 5)
!37 = !DILocation(line: 37, column: 9, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 21, scope: !36)
!40 = !DILocation(line: 39, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !8, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 41, column: 17, scope: !42)
!47 = !DILocation(line: 43, column: 16, scope: !42)
!48 = !DILocation(line: 43, column: 22, scope: !42)
!49 = !DILocation(line: 43, column: 9, scope: !42)
!50 = !DILocation(line: 44, column: 20, scope: !42)
!51 = !DILocation(line: 44, column: 9, scope: !42)
!52 = !DILocation(line: 46, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_07_good", scope: !8, file: !8, line: 97, type: !17, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 99, column: 5, scope: !53)
!55 = !DILocation(line: 100, column: 5, scope: !53)
!56 = !DILocation(line: 101, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 113, type: !58, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!9, !9, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !8, line: 113, type: !9)
!64 = !DILocation(line: 113, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !8, line: 113, type: !60)
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
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !8, line: 55, type: !20)
!79 = !DILocation(line: 55, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !8, line: 56, type: !25)
!81 = !DILocation(line: 56, column: 13, scope: !77)
!82 = !DILocation(line: 57, column: 12, scope: !77)
!83 = !DILocation(line: 57, column: 10, scope: !77)
!84 = !DILocation(line: 58, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !8, line: 58, column: 8)
!86 = !DILocation(line: 58, column: 18, scope: !85)
!87 = !DILocation(line: 58, column: 8, scope: !77)
!88 = !DILocation(line: 61, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !8, line: 59, column: 5)
!90 = !DILocation(line: 62, column: 5, scope: !89)
!91 = !DILocation(line: 66, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !8, line: 64, column: 5)
!93 = !DILocation(line: 66, column: 9, scope: !92)
!94 = !DILocation(line: 67, column: 9, scope: !92)
!95 = !DILocation(line: 67, column: 20, scope: !92)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !8, line: 70, type: !43)
!97 = distinct !DILexicalBlock(scope: !77, file: !8, line: 69, column: 5)
!98 = !DILocation(line: 70, column: 17, scope: !97)
!99 = !DILocation(line: 72, column: 16, scope: !97)
!100 = !DILocation(line: 72, column: 22, scope: !97)
!101 = !DILocation(line: 72, column: 9, scope: !97)
!102 = !DILocation(line: 73, column: 20, scope: !97)
!103 = !DILocation(line: 73, column: 9, scope: !97)
!104 = !DILocation(line: 75, column: 1, scope: !77)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 78, type: !17, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !8, line: 80, type: !20)
!107 = !DILocation(line: 80, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !8, line: 81, type: !25)
!109 = !DILocation(line: 81, column: 13, scope: !105)
!110 = !DILocation(line: 82, column: 12, scope: !105)
!111 = !DILocation(line: 82, column: 10, scope: !105)
!112 = !DILocation(line: 83, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !8, line: 83, column: 8)
!114 = !DILocation(line: 83, column: 18, scope: !113)
!115 = !DILocation(line: 83, column: 8, scope: !105)
!116 = !DILocation(line: 86, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !8, line: 84, column: 5)
!118 = !DILocation(line: 86, column: 9, scope: !117)
!119 = !DILocation(line: 87, column: 9, scope: !117)
!120 = !DILocation(line: 87, column: 20, scope: !117)
!121 = !DILocation(line: 88, column: 5, scope: !117)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !8, line: 90, type: !43)
!123 = distinct !DILexicalBlock(scope: !105, file: !8, line: 89, column: 5)
!124 = !DILocation(line: 90, column: 17, scope: !123)
!125 = !DILocation(line: 92, column: 16, scope: !123)
!126 = !DILocation(line: 92, column: 22, scope: !123)
!127 = !DILocation(line: 92, column: 9, scope: !123)
!128 = !DILocation(line: 93, column: 20, scope: !123)
!129 = !DILocation(line: 93, column: 9, scope: !123)
!130 = !DILocation(line: 95, column: 1, scope: !105)
