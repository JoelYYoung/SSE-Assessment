; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_04_bad() #0 !dbg !11 {
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
  store i64* %arraydecay, i64** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %1, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !55
  %3 = load i64, i64* %arrayidx, align 8, !dbg !55
  %4 = load i64*, i64** %data, align 8, !dbg !56
  %5 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !56
  store i64 %3, i64* %arrayidx1, align 8, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %6, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !65
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !65
  call void @printLongLongLine(i64 %8), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_04_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_04_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_04_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !93 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  store i64* %arraydecay, i64** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !109
  store i64 0, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !113
  %cmp = icmp ult i64 %1, 100, !dbg !115
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !119
  %3 = load i64, i64* %arrayidx, align 8, !dbg !119
  %4 = load i64*, i64** %data, align 8, !dbg !120
  %5 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !120
  store i64 %3, i64* %arrayidx1, align 8, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %6, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !128
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !128
  call void @printLongLongLine(i64 %8), !dbg !129
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !131 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !138
  store i64* %arraydecay, i64** %data, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !142, metadata !DIExpression()), !dbg !144
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !151
  %cmp = icmp ult i64 %1, 100, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !157
  %3 = load i64, i64* %arrayidx, align 8, !dbg !157
  %4 = load i64*, i64** %data, align 8, !dbg !158
  %5 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !158
  store i64 %3, i64* %arrayidx1, align 8, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %6, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !166
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !166
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !166
  call void @printLongLongLine(i64 %8), !dbg !167
  ret void, !dbg !168
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_04_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 30, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 31, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 32, column: 13, scope: !11)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !12, line: 34, column: 5)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!36 = !DILocation(line: 37, column: 14, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 40, type: !29)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!39 = !DILocation(line: 40, column: 17, scope: !38)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 42, type: !42)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 41, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 42, column: 20, scope: !41)
!46 = !DILocation(line: 44, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !12, line: 44, column: 13)
!48 = !DILocation(line: 44, column: 18, scope: !47)
!49 = !DILocation(line: 44, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 44, column: 13)
!51 = !DILocation(line: 44, column: 27, scope: !50)
!52 = !DILocation(line: 44, column: 13, scope: !47)
!53 = !DILocation(line: 46, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 45, column: 13)
!55 = !DILocation(line: 46, column: 27, scope: !54)
!56 = !DILocation(line: 46, column: 17, scope: !54)
!57 = !DILocation(line: 46, column: 22, scope: !54)
!58 = !DILocation(line: 46, column: 25, scope: !54)
!59 = !DILocation(line: 47, column: 13, scope: !54)
!60 = !DILocation(line: 44, column: 35, scope: !50)
!61 = !DILocation(line: 44, column: 13, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 47, column: 13, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 48, column: 31, scope: !41)
!66 = !DILocation(line: 48, column: 13, scope: !41)
!67 = !DILocation(line: 51, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_04_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 114, column: 5, scope: !68)
!70 = !DILocation(line: 115, column: 5, scope: !68)
!71 = !DILocation(line: 116, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 128, type: !73, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !75, !76}
!75 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 128, type: !75)
!80 = !DILocation(line: 128, column: 14, scope: !72)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 128, type: !76)
!82 = !DILocation(line: 128, column: 27, scope: !72)
!83 = !DILocation(line: 131, column: 22, scope: !72)
!84 = !DILocation(line: 131, column: 12, scope: !72)
!85 = !DILocation(line: 131, column: 5, scope: !72)
!86 = !DILocation(line: 133, column: 5, scope: !72)
!87 = !DILocation(line: 134, column: 5, scope: !72)
!88 = !DILocation(line: 135, column: 5, scope: !72)
!89 = !DILocation(line: 138, column: 5, scope: !72)
!90 = !DILocation(line: 139, column: 5, scope: !72)
!91 = !DILocation(line: 140, column: 5, scope: !72)
!92 = !DILocation(line: 142, column: 5, scope: !72)
!93 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 60, type: !16)
!95 = !DILocation(line: 60, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !12, line: 61, type: !24)
!97 = !DILocation(line: 61, column: 13, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !12, line: 62, type: !29)
!99 = !DILocation(line: 62, column: 13, scope: !93)
!100 = !DILocation(line: 71, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !12, line: 69, column: 5)
!102 = distinct !DILexicalBlock(scope: !93, file: !12, line: 63, column: 8)
!103 = !DILocation(line: 71, column: 14, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 74, type: !29)
!105 = distinct !DILexicalBlock(scope: !93, file: !12, line: 73, column: 5)
!106 = !DILocation(line: 74, column: 17, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !108, file: !12, line: 76, type: !42)
!108 = distinct !DILexicalBlock(scope: !105, file: !12, line: 75, column: 9)
!109 = !DILocation(line: 76, column: 20, scope: !108)
!110 = !DILocation(line: 78, column: 20, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 78, column: 13)
!112 = !DILocation(line: 78, column: 18, scope: !111)
!113 = !DILocation(line: 78, column: 25, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 78, column: 13)
!115 = !DILocation(line: 78, column: 27, scope: !114)
!116 = !DILocation(line: 78, column: 13, scope: !111)
!117 = !DILocation(line: 80, column: 34, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !12, line: 79, column: 13)
!119 = !DILocation(line: 80, column: 27, scope: !118)
!120 = !DILocation(line: 80, column: 17, scope: !118)
!121 = !DILocation(line: 80, column: 22, scope: !118)
!122 = !DILocation(line: 80, column: 25, scope: !118)
!123 = !DILocation(line: 81, column: 13, scope: !118)
!124 = !DILocation(line: 78, column: 35, scope: !114)
!125 = !DILocation(line: 78, column: 13, scope: !114)
!126 = distinct !{!126, !116, !127, !64}
!127 = !DILocation(line: 81, column: 13, scope: !111)
!128 = !DILocation(line: 82, column: 31, scope: !108)
!129 = !DILocation(line: 82, column: 13, scope: !108)
!130 = !DILocation(line: 85, column: 1, scope: !93)
!131 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocalVariable(name: "data", scope: !131, file: !12, line: 90, type: !16)
!133 = !DILocation(line: 90, column: 15, scope: !131)
!134 = !DILocalVariable(name: "dataBadBuffer", scope: !131, file: !12, line: 91, type: !24)
!135 = !DILocation(line: 91, column: 13, scope: !131)
!136 = !DILocalVariable(name: "dataGoodBuffer", scope: !131, file: !12, line: 92, type: !29)
!137 = !DILocation(line: 92, column: 13, scope: !131)
!138 = !DILocation(line: 96, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !140, file: !12, line: 94, column: 5)
!140 = distinct !DILexicalBlock(scope: !131, file: !12, line: 93, column: 8)
!141 = !DILocation(line: 96, column: 14, scope: !139)
!142 = !DILocalVariable(name: "source", scope: !143, file: !12, line: 99, type: !29)
!143 = distinct !DILexicalBlock(scope: !131, file: !12, line: 98, column: 5)
!144 = !DILocation(line: 99, column: 17, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !12, line: 101, type: !42)
!146 = distinct !DILexicalBlock(scope: !143, file: !12, line: 100, column: 9)
!147 = !DILocation(line: 101, column: 20, scope: !146)
!148 = !DILocation(line: 103, column: 20, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 103, column: 13)
!150 = !DILocation(line: 103, column: 18, scope: !149)
!151 = !DILocation(line: 103, column: 25, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !12, line: 103, column: 13)
!153 = !DILocation(line: 103, column: 27, scope: !152)
!154 = !DILocation(line: 103, column: 13, scope: !149)
!155 = !DILocation(line: 105, column: 34, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !12, line: 104, column: 13)
!157 = !DILocation(line: 105, column: 27, scope: !156)
!158 = !DILocation(line: 105, column: 17, scope: !156)
!159 = !DILocation(line: 105, column: 22, scope: !156)
!160 = !DILocation(line: 105, column: 25, scope: !156)
!161 = !DILocation(line: 106, column: 13, scope: !156)
!162 = !DILocation(line: 103, column: 35, scope: !152)
!163 = !DILocation(line: 103, column: 13, scope: !152)
!164 = distinct !{!164, !154, !165, !64}
!165 = !DILocation(line: 106, column: 13, scope: !149)
!166 = !DILocation(line: 107, column: 31, scope: !146)
!167 = !DILocation(line: 107, column: 13, scope: !146)
!168 = !DILocation(line: 110, column: 1, scope: !131)
