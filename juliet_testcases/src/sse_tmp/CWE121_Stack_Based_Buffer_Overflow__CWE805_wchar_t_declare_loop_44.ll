; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %1 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !40
  %2 = load i32*, i32** %data, align 8, !dbg !41
  call void %1(i32* %2), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !60
  %cmp = icmp ult i64 %0, 100, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !66
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !66
  %3 = load i32*, i32** %data.addr, align 8, !dbg !67
  %4 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !67
  store i32 %2, i32* %arrayidx2, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %5, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !76
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !76
  store i32 0, i32* %arrayidx3, align 4, !dbg !77
  %7 = load i32*, i32** %data.addr, align 8, !dbg !78
  call void @printWLine(i32* %7), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_44_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #4, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #4, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_44_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_44_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !107, metadata !DIExpression()), !dbg !108
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay, i32** %data, align 8, !dbg !114
  %0 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %1 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !117
  %2 = load i32*, i32** %data, align 8, !dbg !118
  call void %1(i32* %2), !dbg !117
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !120 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !128
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !129
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !135
  %cmp = icmp ult i64 %0, 100, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !141
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !141
  %3 = load i32*, i32** %data.addr, align 8, !dbg !142
  %4 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !142
  store i32 %2, i32* %arrayidx2, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %5, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !150
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !150
  store i32 0, i32* %arrayidx3, align 4, !dbg !151
  %7 = load i32*, i32** %data.addr, align 8, !dbg !152
  call void @printWLine(i32* %7), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_44_bad", scope: !12, file: !12, line: 40, type: !13, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 42, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 42, column: 15, scope: !11)
!21 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 44, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !16}
!25 = !DILocation(line: 44, column: 12, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 45, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 45, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 46, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 46, column: 13, scope: !11)
!36 = !DILocation(line: 49, column: 12, scope: !11)
!37 = !DILocation(line: 49, column: 10, scope: !11)
!38 = !DILocation(line: 50, column: 5, scope: !11)
!39 = !DILocation(line: 50, column: 13, scope: !11)
!40 = !DILocation(line: 52, column: 5, scope: !11)
!41 = !DILocation(line: 52, column: 13, scope: !11)
!42 = !DILocation(line: 53, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !12, line: 23, type: !16)
!45 = !DILocation(line: 23, column: 31, scope: !43)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 26, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 25, column: 5)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 26, column: 16, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !47, file: !12, line: 27, type: !32)
!52 = !DILocation(line: 27, column: 17, scope: !47)
!53 = !DILocation(line: 28, column: 17, scope: !47)
!54 = !DILocation(line: 28, column: 9, scope: !47)
!55 = !DILocation(line: 29, column: 9, scope: !47)
!56 = !DILocation(line: 29, column: 23, scope: !47)
!57 = !DILocation(line: 31, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !47, file: !12, line: 31, column: 9)
!59 = !DILocation(line: 31, column: 14, scope: !58)
!60 = !DILocation(line: 31, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 31, column: 9)
!62 = !DILocation(line: 31, column: 23, scope: !61)
!63 = !DILocation(line: 31, column: 9, scope: !58)
!64 = !DILocation(line: 33, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !12, line: 32, column: 9)
!66 = !DILocation(line: 33, column: 23, scope: !65)
!67 = !DILocation(line: 33, column: 13, scope: !65)
!68 = !DILocation(line: 33, column: 18, scope: !65)
!69 = !DILocation(line: 33, column: 21, scope: !65)
!70 = !DILocation(line: 34, column: 9, scope: !65)
!71 = !DILocation(line: 31, column: 31, scope: !61)
!72 = !DILocation(line: 31, column: 9, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 34, column: 9, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 35, column: 9, scope: !47)
!77 = !DILocation(line: 35, column: 21, scope: !47)
!78 = !DILocation(line: 36, column: 20, scope: !47)
!79 = !DILocation(line: 36, column: 9, scope: !47)
!80 = !DILocation(line: 38, column: 1, scope: !43)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_44_good", scope: !12, file: !12, line: 89, type: !13, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 91, column: 5, scope: !81)
!83 = !DILocation(line: 92, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !85, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!19, !19, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 103, type: !19)
!91 = !DILocation(line: 103, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 103, type: !87)
!93 = !DILocation(line: 103, column: 27, scope: !84)
!94 = !DILocation(line: 106, column: 22, scope: !84)
!95 = !DILocation(line: 106, column: 12, scope: !84)
!96 = !DILocation(line: 106, column: 5, scope: !84)
!97 = !DILocation(line: 108, column: 5, scope: !84)
!98 = !DILocation(line: 109, column: 5, scope: !84)
!99 = !DILocation(line: 110, column: 5, scope: !84)
!100 = !DILocation(line: 113, column: 5, scope: !84)
!101 = !DILocation(line: 114, column: 5, scope: !84)
!102 = !DILocation(line: 115, column: 5, scope: !84)
!103 = !DILocation(line: 117, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 79, type: !16)
!106 = !DILocation(line: 79, column: 15, scope: !104)
!107 = !DILocalVariable(name: "funcPtr", scope: !104, file: !12, line: 80, type: !22)
!108 = !DILocation(line: 80, column: 12, scope: !104)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 81, type: !27)
!110 = !DILocation(line: 81, column: 13, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 82, type: !32)
!112 = !DILocation(line: 82, column: 13, scope: !104)
!113 = !DILocation(line: 84, column: 12, scope: !104)
!114 = !DILocation(line: 84, column: 10, scope: !104)
!115 = !DILocation(line: 85, column: 5, scope: !104)
!116 = !DILocation(line: 85, column: 13, scope: !104)
!117 = !DILocation(line: 86, column: 5, scope: !104)
!118 = !DILocation(line: 86, column: 13, scope: !104)
!119 = !DILocation(line: 87, column: 1, scope: !104)
!120 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 60, type: !23, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", arg: 1, scope: !120, file: !12, line: 60, type: !16)
!122 = !DILocation(line: 60, column: 35, scope: !120)
!123 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 63, type: !48)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 62, column: 5)
!125 = !DILocation(line: 63, column: 16, scope: !124)
!126 = !DILocalVariable(name: "source", scope: !124, file: !12, line: 64, type: !32)
!127 = !DILocation(line: 64, column: 17, scope: !124)
!128 = !DILocation(line: 65, column: 17, scope: !124)
!129 = !DILocation(line: 65, column: 9, scope: !124)
!130 = !DILocation(line: 66, column: 9, scope: !124)
!131 = !DILocation(line: 66, column: 23, scope: !124)
!132 = !DILocation(line: 68, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !124, file: !12, line: 68, column: 9)
!134 = !DILocation(line: 68, column: 14, scope: !133)
!135 = !DILocation(line: 68, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 68, column: 9)
!137 = !DILocation(line: 68, column: 23, scope: !136)
!138 = !DILocation(line: 68, column: 9, scope: !133)
!139 = !DILocation(line: 70, column: 30, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !12, line: 69, column: 9)
!141 = !DILocation(line: 70, column: 23, scope: !140)
!142 = !DILocation(line: 70, column: 13, scope: !140)
!143 = !DILocation(line: 70, column: 18, scope: !140)
!144 = !DILocation(line: 70, column: 21, scope: !140)
!145 = !DILocation(line: 71, column: 9, scope: !140)
!146 = !DILocation(line: 68, column: 31, scope: !136)
!147 = !DILocation(line: 68, column: 9, scope: !136)
!148 = distinct !{!148, !138, !149, !75}
!149 = !DILocation(line: 71, column: 9, scope: !133)
!150 = !DILocation(line: 72, column: 9, scope: !124)
!151 = !DILocation(line: 72, column: 21, scope: !124)
!152 = !DILocation(line: 73, column: 20, scope: !124)
!153 = !DILocation(line: 73, column: 9, scope: !124)
!154 = !DILocation(line: 75, column: 1, scope: !120)
