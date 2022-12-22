; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_goodG2BData = internal global i64* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i64* %arraydecay, i64** %data, align 8, !dbg !39
  %0 = load i64*, i64** %data, align 8, !dbg !40
  store i64* %0, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_good() #0 !dbg !44 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #5, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #5, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !68 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_badData, align 8, !dbg !71
  store i64* %0, i64** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !72, metadata !DIExpression()), !dbg !74
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !DIExpression()), !dbg !80
  store i64 0, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !84
  %cmp = icmp ult i64 %2, 100, !dbg !86
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !90
  %4 = load i64, i64* %arrayidx, align 8, !dbg !90
  %5 = load i64*, i64** %data, align 8, !dbg !91
  %6 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !91
  store i64 %4, i64* %arrayidx1, align 8, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %7, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !100
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !100
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !100
  call void @printLongLongLine(i64 %9), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i64* %arraydecay, i64** %data, align 8, !dbg !111
  %0 = load i64*, i64** %data, align 8, !dbg !112
  store i64* %0, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_goodG2BData, align 8, !dbg !113
  call void @goodG2BSink(), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !116 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_goodG2BData, align 8, !dbg !119
  store i64* %0, i64** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !129
  %cmp = icmp ult i64 %2, 100, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !135
  %4 = load i64, i64* %arrayidx, align 8, !dbg !135
  %5 = load i64*, i64** %data, align 8, !dbg !136
  %6 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !136
  store i64 %4, i64* %arrayidx1, align 8, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %7, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !144
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !144
  call void @printLongLongLine(i64 %9), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_badData", scope: !2, file: !10, line: 19, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 20, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !15, line: 43, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!16 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_bad", scope: !10, file: !10, line: 41, type: !24, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !10, line: 43, type: !11)
!27 = !DILocation(line: 43, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !10, line: 44, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 44, column: 13, scope: !23)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !10, line: 45, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 45, column: 13, scope: !23)
!38 = !DILocation(line: 48, column: 12, scope: !23)
!39 = !DILocation(line: 48, column: 10, scope: !23)
!40 = !DILocation(line: 49, column: 82, scope: !23)
!41 = !DILocation(line: 49, column: 80, scope: !23)
!42 = !DILocation(line: 50, column: 5, scope: !23)
!43 = !DILocation(line: 51, column: 1, scope: !23)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_45_good", scope: !10, file: !10, line: 86, type: !24, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 88, column: 5, scope: !44)
!46 = !DILocation(line: 89, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 100, type: !48, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !10, line: 100, type: !50)
!55 = !DILocation(line: 100, column: 14, scope: !47)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !10, line: 100, type: !51)
!57 = !DILocation(line: 100, column: 27, scope: !47)
!58 = !DILocation(line: 103, column: 22, scope: !47)
!59 = !DILocation(line: 103, column: 12, scope: !47)
!60 = !DILocation(line: 103, column: 5, scope: !47)
!61 = !DILocation(line: 105, column: 5, scope: !47)
!62 = !DILocation(line: 106, column: 5, scope: !47)
!63 = !DILocation(line: 107, column: 5, scope: !47)
!64 = !DILocation(line: 110, column: 5, scope: !47)
!65 = !DILocation(line: 111, column: 5, scope: !47)
!66 = !DILocation(line: 112, column: 5, scope: !47)
!67 = !DILocation(line: 114, column: 5, scope: !47)
!68 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 24, type: !24, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !10, line: 26, type: !11)
!70 = !DILocation(line: 26, column: 15, scope: !68)
!71 = !DILocation(line: 26, column: 22, scope: !68)
!72 = !DILocalVariable(name: "source", scope: !73, file: !10, line: 28, type: !34)
!73 = distinct !DILexicalBlock(scope: !68, file: !10, line: 27, column: 5)
!74 = !DILocation(line: 28, column: 17, scope: !73)
!75 = !DILocalVariable(name: "i", scope: !76, file: !10, line: 30, type: !77)
!76 = distinct !DILexicalBlock(scope: !73, file: !10, line: 29, column: 9)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !78, line: 46, baseType: !79)
!78 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!79 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!80 = !DILocation(line: 30, column: 20, scope: !76)
!81 = !DILocation(line: 32, column: 20, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !10, line: 32, column: 13)
!83 = !DILocation(line: 32, column: 18, scope: !82)
!84 = !DILocation(line: 32, column: 25, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !10, line: 32, column: 13)
!86 = !DILocation(line: 32, column: 27, scope: !85)
!87 = !DILocation(line: 32, column: 13, scope: !82)
!88 = !DILocation(line: 34, column: 34, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !10, line: 33, column: 13)
!90 = !DILocation(line: 34, column: 27, scope: !89)
!91 = !DILocation(line: 34, column: 17, scope: !89)
!92 = !DILocation(line: 34, column: 22, scope: !89)
!93 = !DILocation(line: 34, column: 25, scope: !89)
!94 = !DILocation(line: 35, column: 13, scope: !89)
!95 = !DILocation(line: 32, column: 35, scope: !85)
!96 = !DILocation(line: 32, column: 13, scope: !85)
!97 = distinct !{!97, !87, !98, !99}
!98 = !DILocation(line: 35, column: 13, scope: !82)
!99 = !{!"llvm.loop.mustprogress"}
!100 = !DILocation(line: 36, column: 31, scope: !76)
!101 = !DILocation(line: 36, column: 13, scope: !76)
!102 = !DILocation(line: 39, column: 1, scope: !68)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 75, type: !24, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !10, line: 77, type: !11)
!105 = !DILocation(line: 77, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !10, line: 78, type: !29)
!107 = !DILocation(line: 78, column: 13, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !10, line: 79, type: !34)
!109 = !DILocation(line: 79, column: 13, scope: !103)
!110 = !DILocation(line: 81, column: 12, scope: !103)
!111 = !DILocation(line: 81, column: 10, scope: !103)
!112 = !DILocation(line: 82, column: 86, scope: !103)
!113 = !DILocation(line: 82, column: 84, scope: !103)
!114 = !DILocation(line: 83, column: 5, scope: !103)
!115 = !DILocation(line: 84, column: 1, scope: !103)
!116 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 58, type: !24, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !10, line: 60, type: !11)
!118 = !DILocation(line: 60, column: 15, scope: !116)
!119 = !DILocation(line: 60, column: 22, scope: !116)
!120 = !DILocalVariable(name: "source", scope: !121, file: !10, line: 62, type: !34)
!121 = distinct !DILexicalBlock(scope: !116, file: !10, line: 61, column: 5)
!122 = !DILocation(line: 62, column: 17, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !10, line: 64, type: !77)
!124 = distinct !DILexicalBlock(scope: !121, file: !10, line: 63, column: 9)
!125 = !DILocation(line: 64, column: 20, scope: !124)
!126 = !DILocation(line: 66, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !10, line: 66, column: 13)
!128 = !DILocation(line: 66, column: 18, scope: !127)
!129 = !DILocation(line: 66, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !10, line: 66, column: 13)
!131 = !DILocation(line: 66, column: 27, scope: !130)
!132 = !DILocation(line: 66, column: 13, scope: !127)
!133 = !DILocation(line: 68, column: 34, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !10, line: 67, column: 13)
!135 = !DILocation(line: 68, column: 27, scope: !134)
!136 = !DILocation(line: 68, column: 17, scope: !134)
!137 = !DILocation(line: 68, column: 22, scope: !134)
!138 = !DILocation(line: 68, column: 25, scope: !134)
!139 = !DILocation(line: 69, column: 13, scope: !134)
!140 = !DILocation(line: 66, column: 35, scope: !130)
!141 = !DILocation(line: 66, column: 13, scope: !130)
!142 = distinct !{!142, !132, !143, !99}
!143 = !DILocation(line: 69, column: 13, scope: !127)
!144 = !DILocation(line: 70, column: 31, scope: !124)
!145 = !DILocation(line: 70, column: 13, scope: !124)
!146 = !DILocation(line: 73, column: 1, scope: !116)
