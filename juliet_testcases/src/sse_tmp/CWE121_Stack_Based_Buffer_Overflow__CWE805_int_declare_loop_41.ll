; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !30
  store i64 0, i64* %i, align 8, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !34
  %cmp = icmp ult i64 %1, 100, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !38
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !40
  %3 = load i32, i32* %arrayidx, align 4, !dbg !40
  %4 = load i32*, i32** %data.addr, align 8, !dbg !41
  %5 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !41
  store i32 %3, i32* %arrayidx1, align 4, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !45
  %inc = add i64 %6, 1, !dbg !45
  store i64 %inc, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !50
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !50
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !50
  call void @printIntLine(i32 %8), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_bad() #0 !dbg !53 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !58, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !63, metadata !DIExpression()), !dbg !64
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !65
  store i32* %arraydecay, i32** %data, align 8, !dbg !66
  %0 = load i32*, i32** %data, align 8, !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_badSink(i32* %0), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_goodG2BSink(i32* %data) #0 !dbg !70 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !73, metadata !DIExpression()), !dbg !75
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !82
  %cmp = icmp ult i64 %1, 100, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !88
  %3 = load i32, i32* %arrayidx, align 4, !dbg !88
  %4 = load i32*, i32** %data.addr, align 8, !dbg !89
  %5 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !89
  store i32 %3, i32* %arrayidx1, align 4, !dbg !91
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !93
  %inc = add i64 %6, 1, !dbg !93
  store i64 %inc, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !97
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !97
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !97
  call void @printIntLine(i32 %8), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_good() #0 !dbg !100 {
entry:
  call void @goodG2B(), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !103 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call i64 @time(i64* null) #5, !dbg !113
  %conv = trunc i64 %call to i32, !dbg !114
  call void @srand(i32 %conv) #5, !dbg !115
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !116
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_good(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !119
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_bad(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !121
  ret i32 0, !dbg !122
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !130
  store i32* %arraydecay, i32** %data, align 8, !dbg !131
  %0 = load i32*, i32** %data, align 8, !dbg !132
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_goodG2BSink(i32* %0), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_badSink", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 21, type: !15)
!18 = !DILocation(line: 21, column: 83, scope: !11)
!19 = !DILocalVariable(name: "source", scope: !20, file: !12, line: 24, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 23, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 24, column: 13, scope: !20)
!25 = !DILocalVariable(name: "i", scope: !26, file: !12, line: 26, type: !27)
!26 = distinct !DILexicalBlock(scope: !20, file: !12, line: 25, column: 9)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !28, line: 46, baseType: !29)
!28 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 26, column: 20, scope: !26)
!31 = !DILocation(line: 28, column: 20, scope: !32)
!32 = distinct !DILexicalBlock(scope: !26, file: !12, line: 28, column: 13)
!33 = !DILocation(line: 28, column: 18, scope: !32)
!34 = !DILocation(line: 28, column: 25, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 28, column: 13)
!36 = !DILocation(line: 28, column: 27, scope: !35)
!37 = !DILocation(line: 28, column: 13, scope: !32)
!38 = !DILocation(line: 30, column: 34, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 29, column: 13)
!40 = !DILocation(line: 30, column: 27, scope: !39)
!41 = !DILocation(line: 30, column: 17, scope: !39)
!42 = !DILocation(line: 30, column: 22, scope: !39)
!43 = !DILocation(line: 30, column: 25, scope: !39)
!44 = !DILocation(line: 31, column: 13, scope: !39)
!45 = !DILocation(line: 28, column: 35, scope: !35)
!46 = !DILocation(line: 28, column: 13, scope: !35)
!47 = distinct !{!47, !37, !48, !49}
!48 = !DILocation(line: 31, column: 13, scope: !32)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 32, column: 26, scope: !26)
!51 = !DILocation(line: 32, column: 13, scope: !26)
!52 = !DILocation(line: 35, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_bad", scope: !12, file: !12, line: 37, type: !54, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{null}
!56 = !DILocalVariable(name: "data", scope: !53, file: !12, line: 39, type: !15)
!57 = !DILocation(line: 39, column: 11, scope: !53)
!58 = !DILocalVariable(name: "dataBadBuffer", scope: !53, file: !12, line: 40, type: !59)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 50)
!62 = !DILocation(line: 40, column: 9, scope: !53)
!63 = !DILocalVariable(name: "dataGoodBuffer", scope: !53, file: !12, line: 41, type: !21)
!64 = !DILocation(line: 41, column: 9, scope: !53)
!65 = !DILocation(line: 44, column: 12, scope: !53)
!66 = !DILocation(line: 44, column: 10, scope: !53)
!67 = !DILocation(line: 45, column: 76, scope: !53)
!68 = !DILocation(line: 45, column: 5, scope: !53)
!69 = !DILocation(line: 46, column: 1, scope: !53)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", arg: 1, scope: !70, file: !12, line: 52, type: !15)
!72 = !DILocation(line: 52, column: 87, scope: !70)
!73 = !DILocalVariable(name: "source", scope: !74, file: !12, line: 55, type: !21)
!74 = distinct !DILexicalBlock(scope: !70, file: !12, line: 54, column: 5)
!75 = !DILocation(line: 55, column: 13, scope: !74)
!76 = !DILocalVariable(name: "i", scope: !77, file: !12, line: 57, type: !27)
!77 = distinct !DILexicalBlock(scope: !74, file: !12, line: 56, column: 9)
!78 = !DILocation(line: 57, column: 20, scope: !77)
!79 = !DILocation(line: 59, column: 20, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !12, line: 59, column: 13)
!81 = !DILocation(line: 59, column: 18, scope: !80)
!82 = !DILocation(line: 59, column: 25, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 59, column: 13)
!84 = !DILocation(line: 59, column: 27, scope: !83)
!85 = !DILocation(line: 59, column: 13, scope: !80)
!86 = !DILocation(line: 61, column: 34, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 60, column: 13)
!88 = !DILocation(line: 61, column: 27, scope: !87)
!89 = !DILocation(line: 61, column: 17, scope: !87)
!90 = !DILocation(line: 61, column: 22, scope: !87)
!91 = !DILocation(line: 61, column: 25, scope: !87)
!92 = !DILocation(line: 62, column: 13, scope: !87)
!93 = !DILocation(line: 59, column: 35, scope: !83)
!94 = !DILocation(line: 59, column: 13, scope: !83)
!95 = distinct !{!95, !85, !96, !49}
!96 = !DILocation(line: 62, column: 13, scope: !80)
!97 = !DILocation(line: 63, column: 26, scope: !77)
!98 = !DILocation(line: 63, column: 13, scope: !77)
!99 = !DILocation(line: 66, column: 1, scope: !70)
!100 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_41_good", scope: !12, file: !12, line: 79, type: !54, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 81, column: 5, scope: !100)
!102 = !DILocation(line: 82, column: 1, scope: !100)
!103 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !104, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{!16, !16, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!109 = !DILocalVariable(name: "argc", arg: 1, scope: !103, file: !12, line: 94, type: !16)
!110 = !DILocation(line: 94, column: 14, scope: !103)
!111 = !DILocalVariable(name: "argv", arg: 2, scope: !103, file: !12, line: 94, type: !106)
!112 = !DILocation(line: 94, column: 27, scope: !103)
!113 = !DILocation(line: 97, column: 22, scope: !103)
!114 = !DILocation(line: 97, column: 12, scope: !103)
!115 = !DILocation(line: 97, column: 5, scope: !103)
!116 = !DILocation(line: 99, column: 5, scope: !103)
!117 = !DILocation(line: 100, column: 5, scope: !103)
!118 = !DILocation(line: 101, column: 5, scope: !103)
!119 = !DILocation(line: 104, column: 5, scope: !103)
!120 = !DILocation(line: 105, column: 5, scope: !103)
!121 = !DILocation(line: 106, column: 5, scope: !103)
!122 = !DILocation(line: 108, column: 5, scope: !103)
!123 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !54, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 71, type: !15)
!125 = !DILocation(line: 71, column: 11, scope: !123)
!126 = !DILocalVariable(name: "dataBadBuffer", scope: !123, file: !12, line: 72, type: !59)
!127 = !DILocation(line: 72, column: 9, scope: !123)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !123, file: !12, line: 73, type: !21)
!129 = !DILocation(line: 73, column: 9, scope: !123)
!130 = !DILocation(line: 75, column: 12, scope: !123)
!131 = !DILocation(line: 75, column: 10, scope: !123)
!132 = !DILocation(line: 76, column: 80, scope: !123)
!133 = !DILocation(line: 76, column: 5, scope: !123)
!134 = !DILocation(line: 77, column: 1, scope: !123)
