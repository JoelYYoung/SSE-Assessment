; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i64*, !dbg !26
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 800, align 16, !dbg !29
  %3 = bitcast i8* %2 to i64*, !dbg !30
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !28
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !31
  store i64* %4, i64** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !48
  %cmp = icmp ult i64 %6, 100, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !54
  %8 = load i64, i64* %arrayidx, align 8, !dbg !54
  %9 = load i64*, i64** %data, align 8, !dbg !55
  %10 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !55
  store i64 %8, i64* %arrayidx1, align 8, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %11, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !64
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !64
  call void @printLongLongLine(i64 %13), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 400, align 16, !dbg !97
  %1 = bitcast i8* %0 to i64*, !dbg !98
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %2 = alloca i8, i64 800, align 16, !dbg !101
  %3 = bitcast i8* %2 to i64*, !dbg !102
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !100
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !103
  store i64* %4, i64** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !110
  store i64 0, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !114
  %cmp = icmp ult i64 %6, 100, !dbg !116
  br i1 %cmp, label %for.body, label %for.end, !dbg !117

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !120
  %8 = load i64, i64* %arrayidx, align 8, !dbg !120
  %9 = load i64*, i64** %data, align 8, !dbg !121
  %10 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !121
  store i64 %8, i64* %arrayidx1, align 8, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !125
  %inc = add i64 %11, 1, !dbg !125
  store i64 %inc, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !129
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !129
  call void @printLongLongLine(i64 %13), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !132 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %0 = alloca i8, i64 400, align 16, !dbg !137
  %1 = bitcast i8* %0 to i64*, !dbg !138
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  %2 = alloca i8, i64 800, align 16, !dbg !141
  %3 = bitcast i8* %2 to i64*, !dbg !142
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !140
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !143
  store i64* %4, i64** %data, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !145, metadata !DIExpression()), !dbg !147
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %i, metadata !148, metadata !DIExpression()), !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !154
  %cmp = icmp ult i64 %6, 100, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !160
  %8 = load i64, i64* %arrayidx, align 8, !dbg !160
  %9 = load i64*, i64** %data, align 8, !dbg !161
  %10 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !161
  store i64 %8, i64* %arrayidx1, align 8, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %11, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !169
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !169
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !169
  call void @printLongLongLine(i64 %13), !dbg !170
  ret void, !dbg !171
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 23, type: !4)
!22 = !DILocation(line: 23, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 24, type: !4)
!24 = !DILocation(line: 24, column: 15, scope: !17)
!25 = !DILocation(line: 24, column: 42, scope: !17)
!26 = !DILocation(line: 24, column: 31, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 25, type: !4)
!28 = !DILocation(line: 25, column: 15, scope: !17)
!29 = !DILocation(line: 25, column: 43, scope: !17)
!30 = !DILocation(line: 25, column: 32, scope: !17)
!31 = !DILocation(line: 31, column: 16, scope: !17)
!32 = !DILocation(line: 31, column: 14, scope: !17)
!33 = !DILocalVariable(name: "source", scope: !34, file: !18, line: 39, type: !35)
!34 = distinct !DILexicalBlock(scope: !17, file: !18, line: 38, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 39, column: 17, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !40, file: !18, line: 41, type: !41)
!40 = distinct !DILexicalBlock(scope: !34, file: !18, line: 40, column: 9)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 41, column: 20, scope: !40)
!45 = !DILocation(line: 43, column: 20, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !18, line: 43, column: 13)
!47 = !DILocation(line: 43, column: 18, scope: !46)
!48 = !DILocation(line: 43, column: 25, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !18, line: 43, column: 13)
!50 = !DILocation(line: 43, column: 27, scope: !49)
!51 = !DILocation(line: 43, column: 13, scope: !46)
!52 = !DILocation(line: 45, column: 34, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !18, line: 44, column: 13)
!54 = !DILocation(line: 45, column: 27, scope: !53)
!55 = !DILocation(line: 45, column: 17, scope: !53)
!56 = !DILocation(line: 45, column: 22, scope: !53)
!57 = !DILocation(line: 45, column: 25, scope: !53)
!58 = !DILocation(line: 46, column: 13, scope: !53)
!59 = !DILocation(line: 43, column: 35, scope: !49)
!60 = !DILocation(line: 43, column: 13, scope: !49)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 46, column: 13, scope: !46)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 47, column: 31, scope: !40)
!65 = !DILocation(line: 47, column: 13, scope: !40)
!66 = !DILocation(line: 50, column: 1, scope: !17)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_good", scope: !18, file: !18, line: 118, type: !19, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 120, column: 5, scope: !67)
!69 = !DILocation(line: 121, column: 5, scope: !67)
!70 = !DILocation(line: 122, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 134, type: !72, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !18, line: 134, type: !74)
!79 = !DILocation(line: 134, column: 14, scope: !71)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !18, line: 134, type: !75)
!81 = !DILocation(line: 134, column: 27, scope: !71)
!82 = !DILocation(line: 137, column: 22, scope: !71)
!83 = !DILocation(line: 137, column: 12, scope: !71)
!84 = !DILocation(line: 137, column: 5, scope: !71)
!85 = !DILocation(line: 139, column: 5, scope: !71)
!86 = !DILocation(line: 140, column: 5, scope: !71)
!87 = !DILocation(line: 141, column: 5, scope: !71)
!88 = !DILocation(line: 144, column: 5, scope: !71)
!89 = !DILocation(line: 145, column: 5, scope: !71)
!90 = !DILocation(line: 146, column: 5, scope: !71)
!91 = !DILocation(line: 148, column: 5, scope: !71)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 57, type: !19, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !18, line: 59, type: !4)
!94 = !DILocation(line: 59, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !18, line: 60, type: !4)
!96 = !DILocation(line: 60, column: 15, scope: !92)
!97 = !DILocation(line: 60, column: 42, scope: !92)
!98 = !DILocation(line: 60, column: 31, scope: !92)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !18, line: 61, type: !4)
!100 = !DILocation(line: 61, column: 15, scope: !92)
!101 = !DILocation(line: 61, column: 43, scope: !92)
!102 = !DILocation(line: 61, column: 32, scope: !92)
!103 = !DILocation(line: 70, column: 16, scope: !92)
!104 = !DILocation(line: 70, column: 14, scope: !92)
!105 = !DILocalVariable(name: "source", scope: !106, file: !18, line: 74, type: !35)
!106 = distinct !DILexicalBlock(scope: !92, file: !18, line: 73, column: 5)
!107 = !DILocation(line: 74, column: 17, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !109, file: !18, line: 76, type: !41)
!109 = distinct !DILexicalBlock(scope: !106, file: !18, line: 75, column: 9)
!110 = !DILocation(line: 76, column: 20, scope: !109)
!111 = !DILocation(line: 78, column: 20, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !18, line: 78, column: 13)
!113 = !DILocation(line: 78, column: 18, scope: !112)
!114 = !DILocation(line: 78, column: 25, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !18, line: 78, column: 13)
!116 = !DILocation(line: 78, column: 27, scope: !115)
!117 = !DILocation(line: 78, column: 13, scope: !112)
!118 = !DILocation(line: 80, column: 34, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !18, line: 79, column: 13)
!120 = !DILocation(line: 80, column: 27, scope: !119)
!121 = !DILocation(line: 80, column: 17, scope: !119)
!122 = !DILocation(line: 80, column: 22, scope: !119)
!123 = !DILocation(line: 80, column: 25, scope: !119)
!124 = !DILocation(line: 81, column: 13, scope: !119)
!125 = !DILocation(line: 78, column: 35, scope: !115)
!126 = !DILocation(line: 78, column: 13, scope: !115)
!127 = distinct !{!127, !117, !128, !63}
!128 = !DILocation(line: 81, column: 13, scope: !112)
!129 = !DILocation(line: 82, column: 31, scope: !109)
!130 = !DILocation(line: 82, column: 13, scope: !109)
!131 = !DILocation(line: 85, column: 1, scope: !92)
!132 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocalVariable(name: "data", scope: !132, file: !18, line: 90, type: !4)
!134 = !DILocation(line: 90, column: 15, scope: !132)
!135 = !DILocalVariable(name: "dataBadBuffer", scope: !132, file: !18, line: 91, type: !4)
!136 = !DILocation(line: 91, column: 15, scope: !132)
!137 = !DILocation(line: 91, column: 42, scope: !132)
!138 = !DILocation(line: 91, column: 31, scope: !132)
!139 = !DILocalVariable(name: "dataGoodBuffer", scope: !132, file: !18, line: 92, type: !4)
!140 = !DILocation(line: 92, column: 15, scope: !132)
!141 = !DILocation(line: 92, column: 43, scope: !132)
!142 = !DILocation(line: 92, column: 32, scope: !132)
!143 = !DILocation(line: 97, column: 16, scope: !132)
!144 = !DILocation(line: 97, column: 14, scope: !132)
!145 = !DILocalVariable(name: "source", scope: !146, file: !18, line: 105, type: !35)
!146 = distinct !DILexicalBlock(scope: !132, file: !18, line: 104, column: 5)
!147 = !DILocation(line: 105, column: 17, scope: !146)
!148 = !DILocalVariable(name: "i", scope: !149, file: !18, line: 107, type: !41)
!149 = distinct !DILexicalBlock(scope: !146, file: !18, line: 106, column: 9)
!150 = !DILocation(line: 107, column: 20, scope: !149)
!151 = !DILocation(line: 109, column: 20, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !18, line: 109, column: 13)
!153 = !DILocation(line: 109, column: 18, scope: !152)
!154 = !DILocation(line: 109, column: 25, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !18, line: 109, column: 13)
!156 = !DILocation(line: 109, column: 27, scope: !155)
!157 = !DILocation(line: 109, column: 13, scope: !152)
!158 = !DILocation(line: 111, column: 34, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !18, line: 110, column: 13)
!160 = !DILocation(line: 111, column: 27, scope: !159)
!161 = !DILocation(line: 111, column: 17, scope: !159)
!162 = !DILocation(line: 111, column: 22, scope: !159)
!163 = !DILocation(line: 111, column: 25, scope: !159)
!164 = !DILocation(line: 112, column: 13, scope: !159)
!165 = !DILocation(line: 109, column: 35, scope: !155)
!166 = !DILocation(line: 109, column: 13, scope: !155)
!167 = distinct !{!167, !157, !168, !63}
!168 = !DILocation(line: 112, column: 13, scope: !152)
!169 = !DILocation(line: 113, column: 31, scope: !149)
!170 = !DILocation(line: 113, column: 13, scope: !149)
!171 = !DILocation(line: 116, column: 1, scope: !132)
