; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_44_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !23, metadata !DIExpression()), !dbg !27
  store void (i64*)* @badSink, void (i64*)** %funcPtr, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i64*, !dbg !31
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to i64*, !dbg !35
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !36
  store i64* %4, i64** %data, align 8, !dbg !37
  %5 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !38
  %6 = load i64*, i64** %data, align 8, !dbg !39
  call void %5(i64* %6), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i64* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %1, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !65
  %3 = load i64, i64* %arrayidx, align 8, !dbg !65
  %4 = load i64*, i64** %data.addr, align 8, !dbg !66
  %5 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !66
  store i64 %3, i64* %arrayidx1, align 8, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %6, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !75
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !75
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !75
  call void @printLongLongLine(i64 %8), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_44_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #5, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #5, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_44_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_44_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !105, metadata !DIExpression()), !dbg !106
  store void (i64*)* @goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i64*, !dbg !110
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 800, align 16, !dbg !113
  %3 = bitcast i8* %2 to i64*, !dbg !114
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !112
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !115
  store i64* %4, i64** %data, align 8, !dbg !116
  %5 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !117
  %6 = load i64*, i64** %data, align 8, !dbg !118
  call void %5(i64* %6), !dbg !117
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i64* %data) #0 !dbg !120 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !132
  %cmp = icmp ult i64 %1, 100, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !138
  %3 = load i64, i64* %arrayidx, align 8, !dbg !138
  %4 = load i64*, i64** %data.addr, align 8, !dbg !139
  %5 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !139
  store i64 %3, i64* %arrayidx1, align 8, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %6, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !147
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !147
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !147
  call void @printLongLongLine(i64 %8), !dbg !148
  ret void, !dbg !149
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_44_bad", scope: !18, file: !18, line: 37, type: !19, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_44.c", directory: "/root/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 39, type: !4)
!22 = !DILocation(line: 39, column: 15, scope: !17)
!23 = !DILocalVariable(name: "funcPtr", scope: !17, file: !18, line: 41, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !4}
!27 = !DILocation(line: 41, column: 12, scope: !17)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 42, type: !4)
!29 = !DILocation(line: 42, column: 15, scope: !17)
!30 = !DILocation(line: 42, column: 42, scope: !17)
!31 = !DILocation(line: 42, column: 31, scope: !17)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 43, type: !4)
!33 = !DILocation(line: 43, column: 15, scope: !17)
!34 = !DILocation(line: 43, column: 43, scope: !17)
!35 = !DILocation(line: 43, column: 32, scope: !17)
!36 = !DILocation(line: 46, column: 12, scope: !17)
!37 = !DILocation(line: 46, column: 10, scope: !17)
!38 = !DILocation(line: 48, column: 5, scope: !17)
!39 = !DILocation(line: 48, column: 13, scope: !17)
!40 = !DILocation(line: 49, column: 1, scope: !17)
!41 = distinct !DISubprogram(name: "badSink", scope: !18, file: !18, line: 21, type: !25, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !18, line: 21, type: !4)
!43 = !DILocation(line: 21, column: 31, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !18, line: 24, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !18, line: 23, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 24, column: 17, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !51, file: !18, line: 26, type: !52)
!51 = distinct !DILexicalBlock(scope: !45, file: !18, line: 25, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 46, baseType: !54)
!53 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 26, column: 20, scope: !51)
!56 = !DILocation(line: 28, column: 20, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !18, line: 28, column: 13)
!58 = !DILocation(line: 28, column: 18, scope: !57)
!59 = !DILocation(line: 28, column: 25, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !18, line: 28, column: 13)
!61 = !DILocation(line: 28, column: 27, scope: !60)
!62 = !DILocation(line: 28, column: 13, scope: !57)
!63 = !DILocation(line: 30, column: 34, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !18, line: 29, column: 13)
!65 = !DILocation(line: 30, column: 27, scope: !64)
!66 = !DILocation(line: 30, column: 17, scope: !64)
!67 = !DILocation(line: 30, column: 22, scope: !64)
!68 = !DILocation(line: 30, column: 25, scope: !64)
!69 = !DILocation(line: 31, column: 13, scope: !64)
!70 = !DILocation(line: 28, column: 35, scope: !60)
!71 = !DILocation(line: 28, column: 13, scope: !60)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 31, column: 13, scope: !57)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 32, column: 31, scope: !51)
!76 = !DILocation(line: 32, column: 13, scope: !51)
!77 = !DILocation(line: 35, column: 1, scope: !41)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_44_good", scope: !18, file: !18, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 85, column: 5, scope: !78)
!80 = !DILocation(line: 86, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 97, type: !82, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !18, line: 97, type: !84)
!89 = !DILocation(line: 97, column: 14, scope: !81)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !18, line: 97, type: !85)
!91 = !DILocation(line: 97, column: 27, scope: !81)
!92 = !DILocation(line: 100, column: 22, scope: !81)
!93 = !DILocation(line: 100, column: 12, scope: !81)
!94 = !DILocation(line: 100, column: 5, scope: !81)
!95 = !DILocation(line: 102, column: 5, scope: !81)
!96 = !DILocation(line: 103, column: 5, scope: !81)
!97 = !DILocation(line: 104, column: 5, scope: !81)
!98 = !DILocation(line: 107, column: 5, scope: !81)
!99 = !DILocation(line: 108, column: 5, scope: !81)
!100 = !DILocation(line: 109, column: 5, scope: !81)
!101 = !DILocation(line: 111, column: 5, scope: !81)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 72, type: !19, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !18, line: 74, type: !4)
!104 = !DILocation(line: 74, column: 15, scope: !102)
!105 = !DILocalVariable(name: "funcPtr", scope: !102, file: !18, line: 75, type: !24)
!106 = !DILocation(line: 75, column: 12, scope: !102)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !18, line: 76, type: !4)
!108 = !DILocation(line: 76, column: 15, scope: !102)
!109 = !DILocation(line: 76, column: 42, scope: !102)
!110 = !DILocation(line: 76, column: 31, scope: !102)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !18, line: 77, type: !4)
!112 = !DILocation(line: 77, column: 15, scope: !102)
!113 = !DILocation(line: 77, column: 43, scope: !102)
!114 = !DILocation(line: 77, column: 32, scope: !102)
!115 = !DILocation(line: 79, column: 12, scope: !102)
!116 = !DILocation(line: 79, column: 10, scope: !102)
!117 = !DILocation(line: 80, column: 5, scope: !102)
!118 = !DILocation(line: 80, column: 13, scope: !102)
!119 = !DILocation(line: 81, column: 1, scope: !102)
!120 = distinct !DISubprogram(name: "goodG2BSink", scope: !18, file: !18, line: 56, type: !25, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", arg: 1, scope: !120, file: !18, line: 56, type: !4)
!122 = !DILocation(line: 56, column: 35, scope: !120)
!123 = !DILocalVariable(name: "source", scope: !124, file: !18, line: 59, type: !46)
!124 = distinct !DILexicalBlock(scope: !120, file: !18, line: 58, column: 5)
!125 = !DILocation(line: 59, column: 17, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !127, file: !18, line: 61, type: !52)
!127 = distinct !DILexicalBlock(scope: !124, file: !18, line: 60, column: 9)
!128 = !DILocation(line: 61, column: 20, scope: !127)
!129 = !DILocation(line: 63, column: 20, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !18, line: 63, column: 13)
!131 = !DILocation(line: 63, column: 18, scope: !130)
!132 = !DILocation(line: 63, column: 25, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !18, line: 63, column: 13)
!134 = !DILocation(line: 63, column: 27, scope: !133)
!135 = !DILocation(line: 63, column: 13, scope: !130)
!136 = !DILocation(line: 65, column: 34, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !18, line: 64, column: 13)
!138 = !DILocation(line: 65, column: 27, scope: !137)
!139 = !DILocation(line: 65, column: 17, scope: !137)
!140 = !DILocation(line: 65, column: 22, scope: !137)
!141 = !DILocation(line: 65, column: 25, scope: !137)
!142 = !DILocation(line: 66, column: 13, scope: !137)
!143 = !DILocation(line: 63, column: 35, scope: !133)
!144 = !DILocation(line: 63, column: 13, scope: !133)
!145 = distinct !{!145, !135, !146, !74}
!146 = !DILocation(line: 66, column: 13, scope: !130)
!147 = !DILocation(line: 67, column: 31, scope: !127)
!148 = !DILocation(line: 67, column: 13, scope: !127)
!149 = !DILocation(line: 70, column: 1, scope: !120)
