; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i64* %arraydecay, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %1, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !53
  %3 = load i64, i64* %arrayidx, align 8, !dbg !53
  %4 = load i64*, i64** %data, align 8, !dbg !54
  %5 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !54
  store i64 %3, i64* %arrayidx1, align 8, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %6, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !63
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !63
  call void @printLongLongLine(i64 %8), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_15_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_15_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_15_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  store i64* %arraydecay, i64** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !102
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !109
  %cmp = icmp ult i64 %1, 100, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !115
  %3 = load i64, i64* %arrayidx, align 8, !dbg !115
  %4 = load i64*, i64** %data, align 8, !dbg !116
  %5 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !116
  store i64 %3, i64* %arrayidx1, align 8, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !120
  %inc = add i64 %6, 1, !dbg !120
  store i64 %inc, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !124
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !124
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !124
  call void @printLongLongLine(i64 %8), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !127 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !134
  store i64* %arraydecay, i64** %data, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !145
  %cmp = icmp ult i64 %1, 100, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !151
  %3 = load i64, i64* %arrayidx, align 8, !dbg !151
  %4 = load i64*, i64** %data, align 8, !dbg !152
  %5 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !152
  store i64 %3, i64* %arrayidx1, align 8, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %6, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !160
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !160
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !160
  call void @printLongLongLine(i64 %8), !dbg !161
  ret void, !dbg !162
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_15_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 23, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 24, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 25, column: 13, scope: !11)
!33 = !DILocation(line: 31, column: 16, scope: !11)
!34 = !DILocation(line: 31, column: 14, scope: !11)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 39, type: !29)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!37 = !DILocation(line: 39, column: 17, scope: !36)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 40, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 41, column: 20, scope: !39)
!44 = !DILocation(line: 43, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !12, line: 43, column: 13)
!46 = !DILocation(line: 43, column: 18, scope: !45)
!47 = !DILocation(line: 43, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 43, column: 13)
!49 = !DILocation(line: 43, column: 27, scope: !48)
!50 = !DILocation(line: 43, column: 13, scope: !45)
!51 = !DILocation(line: 45, column: 34, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 44, column: 13)
!53 = !DILocation(line: 45, column: 27, scope: !52)
!54 = !DILocation(line: 45, column: 17, scope: !52)
!55 = !DILocation(line: 45, column: 22, scope: !52)
!56 = !DILocation(line: 45, column: 25, scope: !52)
!57 = !DILocation(line: 46, column: 13, scope: !52)
!58 = !DILocation(line: 43, column: 35, scope: !48)
!59 = !DILocation(line: 43, column: 13, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 46, column: 13, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 47, column: 31, scope: !39)
!64 = !DILocation(line: 47, column: 13, scope: !39)
!65 = !DILocation(line: 50, column: 1, scope: !11)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_15_good", scope: !12, file: !12, line: 118, type: !13, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 120, column: 5, scope: !66)
!68 = !DILocation(line: 121, column: 5, scope: !66)
!69 = !DILocation(line: 122, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 134, type: !71, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!73, !73, !74}
!73 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !12, line: 134, type: !73)
!78 = !DILocation(line: 134, column: 14, scope: !70)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !12, line: 134, type: !74)
!80 = !DILocation(line: 134, column: 27, scope: !70)
!81 = !DILocation(line: 137, column: 22, scope: !70)
!82 = !DILocation(line: 137, column: 12, scope: !70)
!83 = !DILocation(line: 137, column: 5, scope: !70)
!84 = !DILocation(line: 139, column: 5, scope: !70)
!85 = !DILocation(line: 140, column: 5, scope: !70)
!86 = !DILocation(line: 141, column: 5, scope: !70)
!87 = !DILocation(line: 144, column: 5, scope: !70)
!88 = !DILocation(line: 145, column: 5, scope: !70)
!89 = !DILocation(line: 146, column: 5, scope: !70)
!90 = !DILocation(line: 148, column: 5, scope: !70)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 59, type: !16)
!93 = !DILocation(line: 59, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 60, type: !24)
!95 = !DILocation(line: 60, column: 13, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 61, type: !29)
!97 = !DILocation(line: 61, column: 13, scope: !91)
!98 = !DILocation(line: 70, column: 16, scope: !91)
!99 = !DILocation(line: 70, column: 14, scope: !91)
!100 = !DILocalVariable(name: "source", scope: !101, file: !12, line: 74, type: !29)
!101 = distinct !DILexicalBlock(scope: !91, file: !12, line: 73, column: 5)
!102 = !DILocation(line: 74, column: 17, scope: !101)
!103 = !DILocalVariable(name: "i", scope: !104, file: !12, line: 76, type: !40)
!104 = distinct !DILexicalBlock(scope: !101, file: !12, line: 75, column: 9)
!105 = !DILocation(line: 76, column: 20, scope: !104)
!106 = !DILocation(line: 78, column: 20, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 78, column: 13)
!108 = !DILocation(line: 78, column: 18, scope: !107)
!109 = !DILocation(line: 78, column: 25, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 78, column: 13)
!111 = !DILocation(line: 78, column: 27, scope: !110)
!112 = !DILocation(line: 78, column: 13, scope: !107)
!113 = !DILocation(line: 80, column: 34, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 79, column: 13)
!115 = !DILocation(line: 80, column: 27, scope: !114)
!116 = !DILocation(line: 80, column: 17, scope: !114)
!117 = !DILocation(line: 80, column: 22, scope: !114)
!118 = !DILocation(line: 80, column: 25, scope: !114)
!119 = !DILocation(line: 81, column: 13, scope: !114)
!120 = !DILocation(line: 78, column: 35, scope: !110)
!121 = !DILocation(line: 78, column: 13, scope: !110)
!122 = distinct !{!122, !112, !123, !62}
!123 = !DILocation(line: 81, column: 13, scope: !107)
!124 = !DILocation(line: 82, column: 31, scope: !104)
!125 = !DILocation(line: 82, column: 13, scope: !104)
!126 = !DILocation(line: 85, column: 1, scope: !91)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DILocalVariable(name: "data", scope: !127, file: !12, line: 90, type: !16)
!129 = !DILocation(line: 90, column: 15, scope: !127)
!130 = !DILocalVariable(name: "dataBadBuffer", scope: !127, file: !12, line: 91, type: !24)
!131 = !DILocation(line: 91, column: 13, scope: !127)
!132 = !DILocalVariable(name: "dataGoodBuffer", scope: !127, file: !12, line: 92, type: !29)
!133 = !DILocation(line: 92, column: 13, scope: !127)
!134 = !DILocation(line: 97, column: 16, scope: !127)
!135 = !DILocation(line: 97, column: 14, scope: !127)
!136 = !DILocalVariable(name: "source", scope: !137, file: !12, line: 105, type: !29)
!137 = distinct !DILexicalBlock(scope: !127, file: !12, line: 104, column: 5)
!138 = !DILocation(line: 105, column: 17, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !12, line: 107, type: !40)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 106, column: 9)
!141 = !DILocation(line: 107, column: 20, scope: !140)
!142 = !DILocation(line: 109, column: 20, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !12, line: 109, column: 13)
!144 = !DILocation(line: 109, column: 18, scope: !143)
!145 = !DILocation(line: 109, column: 25, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !12, line: 109, column: 13)
!147 = !DILocation(line: 109, column: 27, scope: !146)
!148 = !DILocation(line: 109, column: 13, scope: !143)
!149 = !DILocation(line: 111, column: 34, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !12, line: 110, column: 13)
!151 = !DILocation(line: 111, column: 27, scope: !150)
!152 = !DILocation(line: 111, column: 17, scope: !150)
!153 = !DILocation(line: 111, column: 22, scope: !150)
!154 = !DILocation(line: 111, column: 25, scope: !150)
!155 = !DILocation(line: 112, column: 13, scope: !150)
!156 = !DILocation(line: 109, column: 35, scope: !146)
!157 = !DILocation(line: 109, column: 13, scope: !146)
!158 = distinct !{!158, !148, !159, !62}
!159 = !DILocation(line: 112, column: 13, scope: !143)
!160 = !DILocation(line: 113, column: 31, scope: !140)
!161 = !DILocation(line: 113, column: 13, scope: !140)
!162 = !DILocation(line: 116, column: 1, scope: !127)
