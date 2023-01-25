; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !34
  %6 = load i32*, i32** %data, align 8, !dbg !35
  call void %5(i32* %6), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %1, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !61
  %3 = load i32, i32* %arrayidx, align 4, !dbg !61
  %4 = load i32*, i32** %data.addr, align 8, !dbg !62
  %5 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !62
  store i32 %3, i32* %arrayidx1, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %6, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !71
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !71
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !71
  call void @printIntLine(i32 %8), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_44_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_44_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_44_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !100, metadata !DIExpression()), !dbg !101
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 200, align 16, !dbg !104
  %1 = bitcast i8* %0 to i32*, !dbg !105
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %2 = alloca i8, i64 400, align 16, !dbg !108
  %3 = bitcast i8* %2 to i32*, !dbg !109
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !107
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !110
  store i32* %4, i32** %data, align 8, !dbg !111
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !112
  %6 = load i32*, i32** %data, align 8, !dbg !113
  call void %5(i32* %6), !dbg !112
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !115 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %1, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !133
  %3 = load i32, i32* %arrayidx, align 4, !dbg !133
  %4 = load i32*, i32** %data.addr, align 8, !dbg !134
  %5 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !134
  store i32 %3, i32* %arrayidx1, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %6, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !142
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !142
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !142
  call void @printIntLine(i32 %8), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_44_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 11, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 41, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 41, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 42, type: !4)
!25 = !DILocation(line: 42, column: 11, scope: !13)
!26 = !DILocation(line: 42, column: 34, scope: !13)
!27 = !DILocation(line: 42, column: 27, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 43, type: !4)
!29 = !DILocation(line: 43, column: 11, scope: !13)
!30 = !DILocation(line: 43, column: 35, scope: !13)
!31 = !DILocation(line: 43, column: 28, scope: !13)
!32 = !DILocation(line: 46, column: 12, scope: !13)
!33 = !DILocation(line: 46, column: 10, scope: !13)
!34 = !DILocation(line: 48, column: 5, scope: !13)
!35 = !DILocation(line: 48, column: 13, scope: !13)
!36 = !DILocation(line: 49, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !14, line: 21, type: !4)
!39 = !DILocation(line: 21, column: 27, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !14, line: 24, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 23, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 24, column: 13, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !47, file: !14, line: 26, type: !48)
!47 = distinct !DILexicalBlock(scope: !41, file: !14, line: 25, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 26, column: 20, scope: !47)
!52 = !DILocation(line: 28, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !14, line: 28, column: 13)
!54 = !DILocation(line: 28, column: 18, scope: !53)
!55 = !DILocation(line: 28, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !14, line: 28, column: 13)
!57 = !DILocation(line: 28, column: 27, scope: !56)
!58 = !DILocation(line: 28, column: 13, scope: !53)
!59 = !DILocation(line: 30, column: 34, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !14, line: 29, column: 13)
!61 = !DILocation(line: 30, column: 27, scope: !60)
!62 = !DILocation(line: 30, column: 17, scope: !60)
!63 = !DILocation(line: 30, column: 22, scope: !60)
!64 = !DILocation(line: 30, column: 25, scope: !60)
!65 = !DILocation(line: 31, column: 13, scope: !60)
!66 = !DILocation(line: 28, column: 35, scope: !56)
!67 = !DILocation(line: 28, column: 13, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 31, column: 13, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 32, column: 26, scope: !47)
!72 = !DILocation(line: 32, column: 13, scope: !47)
!73 = !DILocation(line: 35, column: 1, scope: !37)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_44_good", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 85, column: 5, scope: !74)
!76 = !DILocation(line: 86, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 97, type: !78, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!5, !5, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !14, line: 97, type: !5)
!84 = !DILocation(line: 97, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !14, line: 97, type: !80)
!86 = !DILocation(line: 97, column: 27, scope: !77)
!87 = !DILocation(line: 100, column: 22, scope: !77)
!88 = !DILocation(line: 100, column: 12, scope: !77)
!89 = !DILocation(line: 100, column: 5, scope: !77)
!90 = !DILocation(line: 102, column: 5, scope: !77)
!91 = !DILocation(line: 103, column: 5, scope: !77)
!92 = !DILocation(line: 104, column: 5, scope: !77)
!93 = !DILocation(line: 107, column: 5, scope: !77)
!94 = !DILocation(line: 108, column: 5, scope: !77)
!95 = !DILocation(line: 109, column: 5, scope: !77)
!96 = !DILocation(line: 111, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 72, type: !15, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 74, type: !4)
!99 = !DILocation(line: 74, column: 11, scope: !97)
!100 = !DILocalVariable(name: "funcPtr", scope: !97, file: !14, line: 75, type: !20)
!101 = !DILocation(line: 75, column: 12, scope: !97)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !14, line: 76, type: !4)
!103 = !DILocation(line: 76, column: 11, scope: !97)
!104 = !DILocation(line: 76, column: 34, scope: !97)
!105 = !DILocation(line: 76, column: 27, scope: !97)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !14, line: 77, type: !4)
!107 = !DILocation(line: 77, column: 11, scope: !97)
!108 = !DILocation(line: 77, column: 35, scope: !97)
!109 = !DILocation(line: 77, column: 28, scope: !97)
!110 = !DILocation(line: 79, column: 12, scope: !97)
!111 = !DILocation(line: 79, column: 10, scope: !97)
!112 = !DILocation(line: 80, column: 5, scope: !97)
!113 = !DILocation(line: 80, column: 13, scope: !97)
!114 = !DILocation(line: 81, column: 1, scope: !97)
!115 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 56, type: !21, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", arg: 1, scope: !115, file: !14, line: 56, type: !4)
!117 = !DILocation(line: 56, column: 31, scope: !115)
!118 = !DILocalVariable(name: "source", scope: !119, file: !14, line: 59, type: !42)
!119 = distinct !DILexicalBlock(scope: !115, file: !14, line: 58, column: 5)
!120 = !DILocation(line: 59, column: 13, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !122, file: !14, line: 61, type: !48)
!122 = distinct !DILexicalBlock(scope: !119, file: !14, line: 60, column: 9)
!123 = !DILocation(line: 61, column: 20, scope: !122)
!124 = !DILocation(line: 63, column: 20, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !14, line: 63, column: 13)
!126 = !DILocation(line: 63, column: 18, scope: !125)
!127 = !DILocation(line: 63, column: 25, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !14, line: 63, column: 13)
!129 = !DILocation(line: 63, column: 27, scope: !128)
!130 = !DILocation(line: 63, column: 13, scope: !125)
!131 = !DILocation(line: 65, column: 34, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !14, line: 64, column: 13)
!133 = !DILocation(line: 65, column: 27, scope: !132)
!134 = !DILocation(line: 65, column: 17, scope: !132)
!135 = !DILocation(line: 65, column: 22, scope: !132)
!136 = !DILocation(line: 65, column: 25, scope: !132)
!137 = !DILocation(line: 66, column: 13, scope: !132)
!138 = !DILocation(line: 63, column: 35, scope: !128)
!139 = !DILocation(line: 63, column: 13, scope: !128)
!140 = distinct !{!140, !130, !141, !70}
!141 = !DILocation(line: 66, column: 13, scope: !125)
!142 = !DILocation(line: 67, column: 26, scope: !122)
!143 = !DILocation(line: 67, column: 13, scope: !122)
!144 = !DILocation(line: 70, column: 1, scope: !115)
