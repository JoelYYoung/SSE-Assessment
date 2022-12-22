; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %1 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #4, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #4, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_badData, align 8, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i64* %i, metadata !71, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !78
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !79
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !85
  %cmp = icmp ult i64 %1, 100, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !91
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !91
  %4 = load i32*, i32** %data, align 8, !dbg !92
  %5 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !92
  store i32 %3, i32* %arrayidx2, align 4, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %6, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !101
  store i32 0, i32* %arrayidx3, align 4, !dbg !102
  %8 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* %8), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay, i32** %data, align 8, !dbg !114
  %0 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !118
  call void @goodG2BSink(), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !124
  store i32* %0, i32** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !130
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !131
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !137
  %cmp = icmp ult i64 %1, 100, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !143
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !143
  %4 = load i32*, i32** %data, align 8, !dbg !144
  %5 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !144
  store i32 %3, i32* %arrayidx2, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %6, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !152
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !152
  store i32 0, i32* %arrayidx3, align 4, !dbg !153
  %8 = load i32*, i32** %data, align 8, !dbg !154
  call void @printWLine(i32* %8), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !13, line: 74, baseType: !14)
!13 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_bad", scope: !10, file: !10, line: 44, type: !22, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 46, type: !11)
!25 = !DILocation(line: 46, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !10, line: 47, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 47, column: 13, scope: !21)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !10, line: 48, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 48, column: 13, scope: !21)
!36 = !DILocation(line: 51, column: 12, scope: !21)
!37 = !DILocation(line: 51, column: 10, scope: !21)
!38 = !DILocation(line: 52, column: 5, scope: !21)
!39 = !DILocation(line: 52, column: 13, scope: !21)
!40 = !DILocation(line: 53, column: 82, scope: !21)
!41 = !DILocation(line: 53, column: 80, scope: !21)
!42 = !DILocation(line: 54, column: 5, scope: !21)
!43 = !DILocation(line: 55, column: 1, scope: !21)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_45_good", scope: !10, file: !10, line: 92, type: !22, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 94, column: 5, scope: !44)
!46 = !DILocation(line: 95, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 106, type: !48, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!14, !14, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !10, line: 106, type: !14)
!54 = !DILocation(line: 106, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !10, line: 106, type: !50)
!56 = !DILocation(line: 106, column: 27, scope: !47)
!57 = !DILocation(line: 109, column: 22, scope: !47)
!58 = !DILocation(line: 109, column: 12, scope: !47)
!59 = !DILocation(line: 109, column: 5, scope: !47)
!60 = !DILocation(line: 111, column: 5, scope: !47)
!61 = !DILocation(line: 112, column: 5, scope: !47)
!62 = !DILocation(line: 113, column: 5, scope: !47)
!63 = !DILocation(line: 116, column: 5, scope: !47)
!64 = !DILocation(line: 117, column: 5, scope: !47)
!65 = !DILocation(line: 118, column: 5, scope: !47)
!66 = !DILocation(line: 120, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !10, line: 28, type: !11)
!69 = !DILocation(line: 28, column: 15, scope: !67)
!70 = !DILocation(line: 28, column: 22, scope: !67)
!71 = !DILocalVariable(name: "i", scope: !72, file: !10, line: 30, type: !73)
!72 = distinct !DILexicalBlock(scope: !67, file: !10, line: 29, column: 5)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !13, line: 46, baseType: !74)
!74 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!75 = !DILocation(line: 30, column: 16, scope: !72)
!76 = !DILocalVariable(name: "source", scope: !72, file: !10, line: 31, type: !32)
!77 = !DILocation(line: 31, column: 17, scope: !72)
!78 = !DILocation(line: 32, column: 17, scope: !72)
!79 = !DILocation(line: 32, column: 9, scope: !72)
!80 = !DILocation(line: 33, column: 9, scope: !72)
!81 = !DILocation(line: 33, column: 23, scope: !72)
!82 = !DILocation(line: 35, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !72, file: !10, line: 35, column: 9)
!84 = !DILocation(line: 35, column: 14, scope: !83)
!85 = !DILocation(line: 35, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !10, line: 35, column: 9)
!87 = !DILocation(line: 35, column: 23, scope: !86)
!88 = !DILocation(line: 35, column: 9, scope: !83)
!89 = !DILocation(line: 37, column: 30, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !10, line: 36, column: 9)
!91 = !DILocation(line: 37, column: 23, scope: !90)
!92 = !DILocation(line: 37, column: 13, scope: !90)
!93 = !DILocation(line: 37, column: 18, scope: !90)
!94 = !DILocation(line: 37, column: 21, scope: !90)
!95 = !DILocation(line: 38, column: 9, scope: !90)
!96 = !DILocation(line: 35, column: 31, scope: !86)
!97 = !DILocation(line: 35, column: 9, scope: !86)
!98 = distinct !{!98, !88, !99, !100}
!99 = !DILocation(line: 38, column: 9, scope: !83)
!100 = !{!"llvm.loop.mustprogress"}
!101 = !DILocation(line: 39, column: 9, scope: !72)
!102 = !DILocation(line: 39, column: 21, scope: !72)
!103 = !DILocation(line: 40, column: 20, scope: !72)
!104 = !DILocation(line: 40, column: 9, scope: !72)
!105 = !DILocation(line: 42, column: 1, scope: !67)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 80, type: !22, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !10, line: 82, type: !11)
!108 = !DILocation(line: 82, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !10, line: 83, type: !27)
!110 = !DILocation(line: 83, column: 13, scope: !106)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !10, line: 84, type: !32)
!112 = !DILocation(line: 84, column: 13, scope: !106)
!113 = !DILocation(line: 86, column: 12, scope: !106)
!114 = !DILocation(line: 86, column: 10, scope: !106)
!115 = !DILocation(line: 87, column: 5, scope: !106)
!116 = !DILocation(line: 87, column: 13, scope: !106)
!117 = !DILocation(line: 88, column: 86, scope: !106)
!118 = !DILocation(line: 88, column: 84, scope: !106)
!119 = !DILocation(line: 89, column: 5, scope: !106)
!120 = !DILocation(line: 90, column: 1, scope: !106)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DILocalVariable(name: "data", scope: !121, file: !10, line: 64, type: !11)
!123 = !DILocation(line: 64, column: 15, scope: !121)
!124 = !DILocation(line: 64, column: 22, scope: !121)
!125 = !DILocalVariable(name: "i", scope: !126, file: !10, line: 66, type: !73)
!126 = distinct !DILexicalBlock(scope: !121, file: !10, line: 65, column: 5)
!127 = !DILocation(line: 66, column: 16, scope: !126)
!128 = !DILocalVariable(name: "source", scope: !126, file: !10, line: 67, type: !32)
!129 = !DILocation(line: 67, column: 17, scope: !126)
!130 = !DILocation(line: 68, column: 17, scope: !126)
!131 = !DILocation(line: 68, column: 9, scope: !126)
!132 = !DILocation(line: 69, column: 9, scope: !126)
!133 = !DILocation(line: 69, column: 23, scope: !126)
!134 = !DILocation(line: 71, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !126, file: !10, line: 71, column: 9)
!136 = !DILocation(line: 71, column: 14, scope: !135)
!137 = !DILocation(line: 71, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !10, line: 71, column: 9)
!139 = !DILocation(line: 71, column: 23, scope: !138)
!140 = !DILocation(line: 71, column: 9, scope: !135)
!141 = !DILocation(line: 73, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !10, line: 72, column: 9)
!143 = !DILocation(line: 73, column: 23, scope: !142)
!144 = !DILocation(line: 73, column: 13, scope: !142)
!145 = !DILocation(line: 73, column: 18, scope: !142)
!146 = !DILocation(line: 73, column: 21, scope: !142)
!147 = !DILocation(line: 74, column: 9, scope: !142)
!148 = !DILocation(line: 71, column: 31, scope: !138)
!149 = !DILocation(line: 71, column: 9, scope: !138)
!150 = distinct !{!150, !140, !151, !100}
!151 = !DILocation(line: 74, column: 9, scope: !135)
!152 = !DILocation(line: 75, column: 9, scope: !126)
!153 = !DILocation(line: 75, column: 21, scope: !126)
!154 = !DILocation(line: 76, column: 20, scope: !126)
!155 = !DILocation(line: 76, column: 9, scope: !126)
!156 = !DILocation(line: 78, column: 1, scope: !121)
