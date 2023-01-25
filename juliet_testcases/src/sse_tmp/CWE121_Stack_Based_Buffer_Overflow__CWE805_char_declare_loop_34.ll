; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i8* %arraydecay, i8** %data, align 8, !dbg !37
  %0 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %1 = load i8*, i8** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !41
  store i8* %1, i8** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !46
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !46
  store i8* %2, i8** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx3, align 1, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !61
  %cmp = icmp ult i64 %3, 100, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !67
  %5 = load i8, i8* %arrayidx4, align 1, !dbg !67
  %6 = load i8*, i8** %data1, align 8, !dbg !68
  %7 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !68
  store i8 %5, i8* %arrayidx5, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %8, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data1, align 8, !dbg !77
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !77
  store i8 0, i8* %arrayidx6, align 1, !dbg !78
  %10 = load i8*, i8** %data1, align 8, !dbg !79
  call void @printLine(i8* %10), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_unionType* %myUnion, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i8* %arraydecay, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %1 = load i8*, i8** %data, align 8, !dbg !117
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !118
  store i8* %1, i8** %unionFirst, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !120, metadata !DIExpression()), !dbg !122
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !123
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !123
  store i8* %2, i8** %data1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !129
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx3, align 1, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !135
  %cmp = icmp ult i64 %3, 100, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !141
  %5 = load i8, i8* %arrayidx4, align 1, !dbg !141
  %6 = load i8*, i8** %data1, align 8, !dbg !142
  %7 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !142
  store i8 %5, i8* %arrayidx5, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %8, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data1, align 8, !dbg !150
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !150
  store i8 0, i8* %arrayidx6, align 1, !dbg !151
  %10 = load i8*, i8** %data1, align 8, !dbg !152
  call void @printLine(i8* %10), !dbg !153
  ret void, !dbg !154
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_unionType", file: !12, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 23, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 24, baseType: !16, size: 64)
!25 = !DILocation(line: 32, column: 79, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 33, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 10, scope: !11)
!36 = !DILocation(line: 37, column: 12, scope: !11)
!37 = !DILocation(line: 37, column: 10, scope: !11)
!38 = !DILocation(line: 38, column: 5, scope: !11)
!39 = !DILocation(line: 38, column: 13, scope: !11)
!40 = !DILocation(line: 39, column: 26, scope: !11)
!41 = !DILocation(line: 39, column: 13, scope: !11)
!42 = !DILocation(line: 39, column: 24, scope: !11)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 41, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!45 = !DILocation(line: 41, column: 16, scope: !44)
!46 = !DILocation(line: 41, column: 31, scope: !44)
!47 = !DILocalVariable(name: "i", scope: !48, file: !12, line: 43, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 42, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 43, column: 20, scope: !48)
!53 = !DILocalVariable(name: "source", scope: !48, file: !12, line: 44, type: !32)
!54 = !DILocation(line: 44, column: 18, scope: !48)
!55 = !DILocation(line: 45, column: 13, scope: !48)
!56 = !DILocation(line: 46, column: 13, scope: !48)
!57 = !DILocation(line: 46, column: 27, scope: !48)
!58 = !DILocation(line: 48, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !48, file: !12, line: 48, column: 13)
!60 = !DILocation(line: 48, column: 18, scope: !59)
!61 = !DILocation(line: 48, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 48, column: 13)
!63 = !DILocation(line: 48, column: 27, scope: !62)
!64 = !DILocation(line: 48, column: 13, scope: !59)
!65 = !DILocation(line: 50, column: 34, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !12, line: 49, column: 13)
!67 = !DILocation(line: 50, column: 27, scope: !66)
!68 = !DILocation(line: 50, column: 17, scope: !66)
!69 = !DILocation(line: 50, column: 22, scope: !66)
!70 = !DILocation(line: 50, column: 25, scope: !66)
!71 = !DILocation(line: 51, column: 13, scope: !66)
!72 = !DILocation(line: 48, column: 35, scope: !62)
!73 = !DILocation(line: 48, column: 13, scope: !62)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 51, column: 13, scope: !59)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 52, column: 13, scope: !48)
!78 = !DILocation(line: 52, column: 25, scope: !48)
!79 = !DILocation(line: 53, column: 23, scope: !48)
!80 = !DILocation(line: 53, column: 13, scope: !48)
!81 = !DILocation(line: 56, column: 1, scope: !11)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_34_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 93, column: 5, scope: !82)
!84 = !DILocation(line: 94, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 105, type: !86, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 105, type: !88)
!91 = !DILocation(line: 105, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 105, type: !89)
!93 = !DILocation(line: 105, column: 27, scope: !85)
!94 = !DILocation(line: 108, column: 22, scope: !85)
!95 = !DILocation(line: 108, column: 12, scope: !85)
!96 = !DILocation(line: 108, column: 5, scope: !85)
!97 = !DILocation(line: 110, column: 5, scope: !85)
!98 = !DILocation(line: 111, column: 5, scope: !85)
!99 = !DILocation(line: 112, column: 5, scope: !85)
!100 = !DILocation(line: 115, column: 5, scope: !85)
!101 = !DILocation(line: 116, column: 5, scope: !85)
!102 = !DILocation(line: 117, column: 5, scope: !85)
!103 = !DILocation(line: 119, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 65, type: !16)
!106 = !DILocation(line: 65, column: 12, scope: !104)
!107 = !DILocalVariable(name: "myUnion", scope: !104, file: !12, line: 66, type: !20)
!108 = !DILocation(line: 66, column: 79, scope: !104)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 67, type: !27)
!110 = !DILocation(line: 67, column: 10, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 68, type: !32)
!112 = !DILocation(line: 68, column: 10, scope: !104)
!113 = !DILocation(line: 70, column: 12, scope: !104)
!114 = !DILocation(line: 70, column: 10, scope: !104)
!115 = !DILocation(line: 71, column: 5, scope: !104)
!116 = !DILocation(line: 71, column: 13, scope: !104)
!117 = !DILocation(line: 72, column: 26, scope: !104)
!118 = !DILocation(line: 72, column: 13, scope: !104)
!119 = !DILocation(line: 72, column: 24, scope: !104)
!120 = !DILocalVariable(name: "data", scope: !121, file: !12, line: 74, type: !16)
!121 = distinct !DILexicalBlock(scope: !104, file: !12, line: 73, column: 5)
!122 = !DILocation(line: 74, column: 16, scope: !121)
!123 = !DILocation(line: 74, column: 31, scope: !121)
!124 = !DILocalVariable(name: "i", scope: !125, file: !12, line: 76, type: !49)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 75, column: 9)
!126 = !DILocation(line: 76, column: 20, scope: !125)
!127 = !DILocalVariable(name: "source", scope: !125, file: !12, line: 77, type: !32)
!128 = !DILocation(line: 77, column: 18, scope: !125)
!129 = !DILocation(line: 78, column: 13, scope: !125)
!130 = !DILocation(line: 79, column: 13, scope: !125)
!131 = !DILocation(line: 79, column: 27, scope: !125)
!132 = !DILocation(line: 81, column: 20, scope: !133)
!133 = distinct !DILexicalBlock(scope: !125, file: !12, line: 81, column: 13)
!134 = !DILocation(line: 81, column: 18, scope: !133)
!135 = !DILocation(line: 81, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 81, column: 13)
!137 = !DILocation(line: 81, column: 27, scope: !136)
!138 = !DILocation(line: 81, column: 13, scope: !133)
!139 = !DILocation(line: 83, column: 34, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !12, line: 82, column: 13)
!141 = !DILocation(line: 83, column: 27, scope: !140)
!142 = !DILocation(line: 83, column: 17, scope: !140)
!143 = !DILocation(line: 83, column: 22, scope: !140)
!144 = !DILocation(line: 83, column: 25, scope: !140)
!145 = !DILocation(line: 84, column: 13, scope: !140)
!146 = !DILocation(line: 81, column: 35, scope: !136)
!147 = !DILocation(line: 81, column: 13, scope: !136)
!148 = distinct !{!148, !138, !149, !76}
!149 = !DILocation(line: 84, column: 13, scope: !133)
!150 = !DILocation(line: 85, column: 13, scope: !125)
!151 = !DILocation(line: 85, column: 25, scope: !125)
!152 = !DILocation(line: 86, column: 23, scope: !125)
!153 = !DILocation(line: 86, column: 13, scope: !125)
!154 = !DILocation(line: 89, column: 1, scope: !104)
