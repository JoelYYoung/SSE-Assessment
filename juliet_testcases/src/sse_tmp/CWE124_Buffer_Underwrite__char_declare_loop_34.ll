; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE124_Buffer_Underwrite__char_declare_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__char_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__char_declare_loop_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !34
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !35
  store i8* %add.ptr, i8** %data, align 8, !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !38
  store i8* %0, i8** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !43
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !43
  store i8* %1, i8** %data2, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx4, align 1, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !58
  %cmp = icmp ult i64 %2, 100, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !64
  %4 = load i8, i8* %arrayidx5, align 1, !dbg !64
  %5 = load i8*, i8** %data2, align 8, !dbg !65
  %6 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !65
  store i8 %4, i8* %arrayidx6, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %7, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data2, align 8, !dbg !74
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !74
  store i8 0, i8* %arrayidx7, align 1, !dbg !75
  %9 = load i8*, i8** %data2, align 8, !dbg !76
  call void @printLine(i8* %9), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_34_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #5, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #5, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE124_Buffer_Underwrite__char_declare_loop_34_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE124_Buffer_Underwrite__char_declare_loop_34_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__char_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__char_declare_loop_34_unionType* %myUnion, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !108
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !111
  store i8* %arraydecay1, i8** %data, align 8, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !114
  store i8* %0, i8** %unionFirst, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !116, metadata !DIExpression()), !dbg !118
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !119
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !119
  store i8* %1, i8** %data2, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx4, align 1, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !131
  %cmp = icmp ult i64 %2, 100, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !137
  %4 = load i8, i8* %arrayidx5, align 1, !dbg !137
  %5 = load i8*, i8** %data2, align 8, !dbg !138
  %6 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !138
  store i8 %4, i8* %arrayidx6, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %7, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data2, align 8, !dbg !146
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !146
  store i8 0, i8* %arrayidx7, align 1, !dbg !147
  %9 = load i8*, i8** %data2, align 8, !dbg !148
  call void @printLine(i8* %9), !dbg !149
  ret void, !dbg !150
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE124_Buffer_Underwrite__char_declare_loop_34_unionType", file: !12, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 23, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 24, baseType: !16, size: 64)
!25 = !DILocation(line: 32, column: 62, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 10, scope: !11)
!31 = !DILocation(line: 34, column: 5, scope: !11)
!32 = !DILocation(line: 35, column: 5, scope: !11)
!33 = !DILocation(line: 35, column: 23, scope: !11)
!34 = !DILocation(line: 37, column: 12, scope: !11)
!35 = !DILocation(line: 37, column: 23, scope: !11)
!36 = !DILocation(line: 37, column: 10, scope: !11)
!37 = !DILocation(line: 38, column: 26, scope: !11)
!38 = !DILocation(line: 38, column: 13, scope: !11)
!39 = !DILocation(line: 38, column: 24, scope: !11)
!40 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 40, type: !16)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!42 = !DILocation(line: 40, column: 16, scope: !41)
!43 = !DILocation(line: 40, column: 31, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 41, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 42, column: 20, scope: !45)
!50 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 43, type: !27)
!51 = !DILocation(line: 43, column: 18, scope: !45)
!52 = !DILocation(line: 44, column: 13, scope: !45)
!53 = !DILocation(line: 45, column: 13, scope: !45)
!54 = !DILocation(line: 45, column: 27, scope: !45)
!55 = !DILocation(line: 47, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !45, file: !12, line: 47, column: 13)
!57 = !DILocation(line: 47, column: 18, scope: !56)
!58 = !DILocation(line: 47, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 47, column: 13)
!60 = !DILocation(line: 47, column: 27, scope: !59)
!61 = !DILocation(line: 47, column: 13, scope: !56)
!62 = !DILocation(line: 49, column: 34, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !12, line: 48, column: 13)
!64 = !DILocation(line: 49, column: 27, scope: !63)
!65 = !DILocation(line: 49, column: 17, scope: !63)
!66 = !DILocation(line: 49, column: 22, scope: !63)
!67 = !DILocation(line: 49, column: 25, scope: !63)
!68 = !DILocation(line: 50, column: 13, scope: !63)
!69 = !DILocation(line: 47, column: 35, scope: !59)
!70 = !DILocation(line: 47, column: 13, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 50, column: 13, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 52, column: 13, scope: !45)
!75 = !DILocation(line: 52, column: 25, scope: !45)
!76 = !DILocation(line: 53, column: 23, scope: !45)
!77 = !DILocation(line: 53, column: 13, scope: !45)
!78 = !DILocation(line: 56, column: 1, scope: !11)
!79 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_34_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 94, column: 5, scope: !79)
!81 = !DILocation(line: 95, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !83, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 106, type: !85)
!88 = !DILocation(line: 106, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 106, type: !86)
!90 = !DILocation(line: 106, column: 27, scope: !82)
!91 = !DILocation(line: 109, column: 22, scope: !82)
!92 = !DILocation(line: 109, column: 12, scope: !82)
!93 = !DILocation(line: 109, column: 5, scope: !82)
!94 = !DILocation(line: 111, column: 5, scope: !82)
!95 = !DILocation(line: 112, column: 5, scope: !82)
!96 = !DILocation(line: 113, column: 5, scope: !82)
!97 = !DILocation(line: 116, column: 5, scope: !82)
!98 = !DILocation(line: 117, column: 5, scope: !82)
!99 = !DILocation(line: 118, column: 5, scope: !82)
!100 = !DILocation(line: 120, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 65, type: !16)
!103 = !DILocation(line: 65, column: 12, scope: !101)
!104 = !DILocalVariable(name: "myUnion", scope: !101, file: !12, line: 66, type: !20)
!105 = !DILocation(line: 66, column: 62, scope: !101)
!106 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !12, line: 67, type: !27)
!107 = !DILocation(line: 67, column: 10, scope: !101)
!108 = !DILocation(line: 68, column: 5, scope: !101)
!109 = !DILocation(line: 69, column: 5, scope: !101)
!110 = !DILocation(line: 69, column: 23, scope: !101)
!111 = !DILocation(line: 71, column: 12, scope: !101)
!112 = !DILocation(line: 71, column: 10, scope: !101)
!113 = !DILocation(line: 72, column: 26, scope: !101)
!114 = !DILocation(line: 72, column: 13, scope: !101)
!115 = !DILocation(line: 72, column: 24, scope: !101)
!116 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 74, type: !16)
!117 = distinct !DILexicalBlock(scope: !101, file: !12, line: 73, column: 5)
!118 = !DILocation(line: 74, column: 16, scope: !117)
!119 = !DILocation(line: 74, column: 31, scope: !117)
!120 = !DILocalVariable(name: "i", scope: !121, file: !12, line: 76, type: !46)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 75, column: 9)
!122 = !DILocation(line: 76, column: 20, scope: !121)
!123 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 77, type: !27)
!124 = !DILocation(line: 77, column: 18, scope: !121)
!125 = !DILocation(line: 78, column: 13, scope: !121)
!126 = !DILocation(line: 79, column: 13, scope: !121)
!127 = !DILocation(line: 79, column: 27, scope: !121)
!128 = !DILocation(line: 81, column: 20, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !12, line: 81, column: 13)
!130 = !DILocation(line: 81, column: 18, scope: !129)
!131 = !DILocation(line: 81, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 81, column: 13)
!133 = !DILocation(line: 81, column: 27, scope: !132)
!134 = !DILocation(line: 81, column: 13, scope: !129)
!135 = !DILocation(line: 83, column: 34, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !12, line: 82, column: 13)
!137 = !DILocation(line: 83, column: 27, scope: !136)
!138 = !DILocation(line: 83, column: 17, scope: !136)
!139 = !DILocation(line: 83, column: 22, scope: !136)
!140 = !DILocation(line: 83, column: 25, scope: !136)
!141 = !DILocation(line: 84, column: 13, scope: !136)
!142 = !DILocation(line: 81, column: 35, scope: !132)
!143 = !DILocation(line: 81, column: 13, scope: !132)
!144 = distinct !{!144, !134, !145, !73}
!145 = !DILocation(line: 84, column: 13, scope: !129)
!146 = !DILocation(line: 86, column: 13, scope: !121)
!147 = !DILocation(line: 86, column: 25, scope: !121)
!148 = !DILocation(line: 87, column: 23, scope: !121)
!149 = !DILocation(line: 87, column: 13, scope: !121)
!150 = !DILocation(line: 90, column: 1, scope: !101)
