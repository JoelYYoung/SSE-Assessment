; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 100, align 16, !dbg !28
  store i8* %0, i8** %dataBuffer, align 8, !dbg !27
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  store i8* %1, i8** %data, align 8, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !36
  store i8* %4, i8** %unionFirst, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !38, metadata !DIExpression()), !dbg !40
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !41
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !41
  store i8* %5, i8** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !53, metadata !DIExpression()), !dbg !54
  %7 = load i8*, i8** %data1, align 8, !dbg !55
  %call = call i64 @strlen(i8* %7) #6, !dbg !56
  store i64 %call, i64* %dataLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !61
  %9 = load i64, i64* %dataLen, align 8, !dbg !63
  %cmp = icmp ult i64 %8, %9, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !66
  %11 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !66
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !66
  %13 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !70
  store i8 %12, i8* %arrayidx3, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %14, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !78
  store i8 0, i8* %arrayidx4, align 1, !dbg !79
  %15 = load i8*, i8** %data1, align 8, !dbg !80
  call void @printLine(i8* %15), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #7, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #7, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 100, align 16, !dbg !112
  store i8* %0, i8** %dataBuffer, align 8, !dbg !111
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !113
  store i8* %1, i8** %data, align 8, !dbg !114
  %2 = load i8*, i8** %data, align 8, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !116
  %3 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !120
  store i8* %4, i8** %unionFirst, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !122, metadata !DIExpression()), !dbg !124
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !125
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !125
  store i8* %5, i8** %data1, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !131, metadata !DIExpression()), !dbg !132
  %7 = load i8*, i8** %data1, align 8, !dbg !133
  %call = call i64 @strlen(i8* %7) #6, !dbg !134
  store i64 %call, i64* %dataLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !139
  %9 = load i64, i64* %dataLen, align 8, !dbg !141
  %cmp = icmp ult i64 %8, %9, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !144
  %11 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !144
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !144
  %13 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !148
  store i8 %12, i8* %arrayidx3, align 1, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %14, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !155
  store i8 0, i8* %arrayidx4, align 1, !dbg !156
  %15 = load i8*, i8** %data1, align 8, !dbg !157
  call void @printLine(i8* %15), !dbg !158
  ret void, !dbg !159
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_unionType", file: !14, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !14, line: 23, baseType: !4, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !14, line: 24, baseType: !4, size: 64)
!25 = !DILocation(line: 32, column: 78, scope: !13)
!26 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 33, type: !4)
!27 = !DILocation(line: 33, column: 12, scope: !13)
!28 = !DILocation(line: 33, column: 33, scope: !13)
!29 = !DILocation(line: 34, column: 12, scope: !13)
!30 = !DILocation(line: 34, column: 10, scope: !13)
!31 = !DILocation(line: 36, column: 12, scope: !13)
!32 = !DILocation(line: 36, column: 5, scope: !13)
!33 = !DILocation(line: 37, column: 5, scope: !13)
!34 = !DILocation(line: 37, column: 17, scope: !13)
!35 = !DILocation(line: 38, column: 26, scope: !13)
!36 = !DILocation(line: 38, column: 13, scope: !13)
!37 = !DILocation(line: 38, column: 24, scope: !13)
!38 = !DILocalVariable(name: "data", scope: !39, file: !14, line: 40, type: !4)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!40 = !DILocation(line: 40, column: 16, scope: !39)
!41 = !DILocation(line: 40, column: 31, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !14, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !14, line: 41, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 42, column: 18, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !43, file: !14, line: 43, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 43, column: 20, scope: !43)
!53 = !DILocalVariable(name: "dataLen", scope: !43, file: !14, line: 43, type: !49)
!54 = !DILocation(line: 43, column: 23, scope: !43)
!55 = !DILocation(line: 44, column: 30, scope: !43)
!56 = !DILocation(line: 44, column: 23, scope: !43)
!57 = !DILocation(line: 44, column: 21, scope: !43)
!58 = !DILocation(line: 46, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !43, file: !14, line: 46, column: 13)
!60 = !DILocation(line: 46, column: 18, scope: !59)
!61 = !DILocation(line: 46, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !14, line: 46, column: 13)
!63 = !DILocation(line: 46, column: 29, scope: !62)
!64 = !DILocation(line: 46, column: 27, scope: !62)
!65 = !DILocation(line: 46, column: 13, scope: !59)
!66 = !DILocation(line: 48, column: 27, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !14, line: 47, column: 13)
!68 = !DILocation(line: 48, column: 32, scope: !67)
!69 = !DILocation(line: 48, column: 22, scope: !67)
!70 = !DILocation(line: 48, column: 17, scope: !67)
!71 = !DILocation(line: 48, column: 25, scope: !67)
!72 = !DILocation(line: 49, column: 13, scope: !67)
!73 = !DILocation(line: 46, column: 39, scope: !62)
!74 = !DILocation(line: 46, column: 13, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 49, column: 13, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 50, column: 13, scope: !43)
!79 = !DILocation(line: 50, column: 24, scope: !43)
!80 = !DILocation(line: 51, column: 23, scope: !43)
!81 = !DILocation(line: 51, column: 13, scope: !43)
!82 = !DILocation(line: 54, column: 1, scope: !13)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_34_good", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 90, column: 5, scope: !83)
!85 = !DILocation(line: 91, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 102, type: !87, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!89, !89, !90}
!89 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !14, line: 102, type: !89)
!92 = !DILocation(line: 102, column: 14, scope: !86)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !14, line: 102, type: !90)
!94 = !DILocation(line: 102, column: 27, scope: !86)
!95 = !DILocation(line: 105, column: 22, scope: !86)
!96 = !DILocation(line: 105, column: 12, scope: !86)
!97 = !DILocation(line: 105, column: 5, scope: !86)
!98 = !DILocation(line: 107, column: 5, scope: !86)
!99 = !DILocation(line: 108, column: 5, scope: !86)
!100 = !DILocation(line: 109, column: 5, scope: !86)
!101 = !DILocation(line: 112, column: 5, scope: !86)
!102 = !DILocation(line: 113, column: 5, scope: !86)
!103 = !DILocation(line: 114, column: 5, scope: !86)
!104 = !DILocation(line: 116, column: 5, scope: !86)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 63, type: !4)
!107 = !DILocation(line: 63, column: 12, scope: !105)
!108 = !DILocalVariable(name: "myUnion", scope: !105, file: !14, line: 64, type: !20)
!109 = !DILocation(line: 64, column: 78, scope: !105)
!110 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !14, line: 65, type: !4)
!111 = !DILocation(line: 65, column: 12, scope: !105)
!112 = !DILocation(line: 65, column: 33, scope: !105)
!113 = !DILocation(line: 66, column: 12, scope: !105)
!114 = !DILocation(line: 66, column: 10, scope: !105)
!115 = !DILocation(line: 68, column: 12, scope: !105)
!116 = !DILocation(line: 68, column: 5, scope: !105)
!117 = !DILocation(line: 69, column: 5, scope: !105)
!118 = !DILocation(line: 69, column: 16, scope: !105)
!119 = !DILocation(line: 70, column: 26, scope: !105)
!120 = !DILocation(line: 70, column: 13, scope: !105)
!121 = !DILocation(line: 70, column: 24, scope: !105)
!122 = !DILocalVariable(name: "data", scope: !123, file: !14, line: 72, type: !4)
!123 = distinct !DILexicalBlock(scope: !105, file: !14, line: 71, column: 5)
!124 = !DILocation(line: 72, column: 16, scope: !123)
!125 = !DILocation(line: 72, column: 31, scope: !123)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !14, line: 74, type: !44)
!127 = distinct !DILexicalBlock(scope: !123, file: !14, line: 73, column: 9)
!128 = !DILocation(line: 74, column: 18, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !127, file: !14, line: 75, type: !49)
!130 = !DILocation(line: 75, column: 20, scope: !127)
!131 = !DILocalVariable(name: "dataLen", scope: !127, file: !14, line: 75, type: !49)
!132 = !DILocation(line: 75, column: 23, scope: !127)
!133 = !DILocation(line: 76, column: 30, scope: !127)
!134 = !DILocation(line: 76, column: 23, scope: !127)
!135 = !DILocation(line: 76, column: 21, scope: !127)
!136 = !DILocation(line: 78, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !14, line: 78, column: 13)
!138 = !DILocation(line: 78, column: 18, scope: !137)
!139 = !DILocation(line: 78, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !14, line: 78, column: 13)
!141 = !DILocation(line: 78, column: 29, scope: !140)
!142 = !DILocation(line: 78, column: 27, scope: !140)
!143 = !DILocation(line: 78, column: 13, scope: !137)
!144 = !DILocation(line: 80, column: 27, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !14, line: 79, column: 13)
!146 = !DILocation(line: 80, column: 32, scope: !145)
!147 = !DILocation(line: 80, column: 22, scope: !145)
!148 = !DILocation(line: 80, column: 17, scope: !145)
!149 = !DILocation(line: 80, column: 25, scope: !145)
!150 = !DILocation(line: 81, column: 13, scope: !145)
!151 = !DILocation(line: 78, column: 39, scope: !140)
!152 = !DILocation(line: 78, column: 13, scope: !140)
!153 = distinct !{!153, !143, !154, !77}
!154 = !DILocation(line: 81, column: 13, scope: !137)
!155 = !DILocation(line: 82, column: 13, scope: !127)
!156 = !DILocation(line: 82, column: 24, scope: !127)
!157 = !DILocation(line: 83, column: 23, scope: !127)
!158 = !DILocation(line: 83, column: 13, scope: !127)
!159 = !DILocation(line: 86, column: 1, scope: !105)
