; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !34
  %cmp = icmp slt i32 %0, 1, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %1, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !49
  %3 = load i32*, i32** %data, align 8, !dbg !50
  %4 = bitcast i32* %3 to i8*, !dbg !51
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %5 = bitcast i32* %arraydecay1 to i8*, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !52
  %7 = load i32, i32* %arrayidx, align 4, !dbg !52
  call void @printIntLine(i32 %7), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_17_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_17_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_17_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 0, i32* %h, align 4, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !90
  %cmp = icmp slt i32 %0, 1, !dbg !92
  br i1 %cmp, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !94
  store i32* %arraydecay, i32** %data, align 8, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !98
  %inc = add nsw i32 %1, 1, !dbg !98
  store i32 %inc, i32* %h, align 4, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !104
  %3 = load i32*, i32** %data, align 8, !dbg !105
  %4 = bitcast i32* %3 to i8*, !dbg !106
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %5 = bitcast i32* %arraydecay1 to i8*, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !106
  %6 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !107
  %7 = load i32, i32* %arrayidx, align 4, !dbg !107
  call void @printIntLine(i32 %7), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_17_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 23, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!20 = !DILocation(line: 24, column: 11, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 25, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 25, column: 9, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 26, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 26, column: 9, scope: !11)
!31 = !DILocation(line: 27, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!33 = !DILocation(line: 27, column: 9, scope: !32)
!34 = !DILocation(line: 27, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 27, column: 5)
!36 = !DILocation(line: 27, column: 18, scope: !35)
!37 = !DILocation(line: 27, column: 5, scope: !32)
!38 = !DILocation(line: 31, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 28, column: 5)
!40 = !DILocation(line: 31, column: 14, scope: !39)
!41 = !DILocation(line: 32, column: 5, scope: !39)
!42 = !DILocation(line: 27, column: 24, scope: !35)
!43 = !DILocation(line: 27, column: 5, scope: !35)
!44 = distinct !{!44, !37, !45, !46}
!45 = !DILocation(line: 32, column: 5, scope: !32)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "source", scope: !48, file: !12, line: 34, type: !27)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!49 = !DILocation(line: 34, column: 13, scope: !48)
!50 = !DILocation(line: 36, column: 17, scope: !48)
!51 = !DILocation(line: 36, column: 9, scope: !48)
!52 = !DILocation(line: 37, column: 22, scope: !48)
!53 = !DILocation(line: 37, column: 9, scope: !48)
!54 = !DILocation(line: 39, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_17_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 67, column: 5, scope: !55)
!57 = !DILocation(line: 68, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 80, type: !59, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!16, !16, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 80, type: !16)
!65 = !DILocation(line: 80, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 80, type: !61)
!67 = !DILocation(line: 80, column: 27, scope: !58)
!68 = !DILocation(line: 83, column: 22, scope: !58)
!69 = !DILocation(line: 83, column: 12, scope: !58)
!70 = !DILocation(line: 83, column: 5, scope: !58)
!71 = !DILocation(line: 85, column: 5, scope: !58)
!72 = !DILocation(line: 86, column: 5, scope: !58)
!73 = !DILocation(line: 87, column: 5, scope: !58)
!74 = !DILocation(line: 90, column: 5, scope: !58)
!75 = !DILocation(line: 91, column: 5, scope: !58)
!76 = !DILocation(line: 92, column: 5, scope: !58)
!77 = !DILocation(line: 94, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "h", scope: !78, file: !12, line: 48, type: !16)
!80 = !DILocation(line: 48, column: 9, scope: !78)
!81 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 49, type: !19)
!82 = !DILocation(line: 49, column: 11, scope: !78)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !12, line: 50, type: !22)
!84 = !DILocation(line: 50, column: 9, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !12, line: 51, type: !27)
!86 = !DILocation(line: 51, column: 9, scope: !78)
!87 = !DILocation(line: 52, column: 11, scope: !88)
!88 = distinct !DILexicalBlock(scope: !78, file: !12, line: 52, column: 5)
!89 = !DILocation(line: 52, column: 9, scope: !88)
!90 = !DILocation(line: 52, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !12, line: 52, column: 5)
!92 = !DILocation(line: 52, column: 18, scope: !91)
!93 = !DILocation(line: 52, column: 5, scope: !88)
!94 = !DILocation(line: 55, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !12, line: 53, column: 5)
!96 = !DILocation(line: 55, column: 14, scope: !95)
!97 = !DILocation(line: 56, column: 5, scope: !95)
!98 = !DILocation(line: 52, column: 24, scope: !91)
!99 = !DILocation(line: 52, column: 5, scope: !91)
!100 = distinct !{!100, !93, !101, !46}
!101 = !DILocation(line: 56, column: 5, scope: !88)
!102 = !DILocalVariable(name: "source", scope: !103, file: !12, line: 58, type: !27)
!103 = distinct !DILexicalBlock(scope: !78, file: !12, line: 57, column: 5)
!104 = !DILocation(line: 58, column: 13, scope: !103)
!105 = !DILocation(line: 60, column: 17, scope: !103)
!106 = !DILocation(line: 60, column: 9, scope: !103)
!107 = !DILocation(line: 61, column: 22, scope: !103)
!108 = !DILocation(line: 61, column: 9, scope: !103)
!109 = !DILocation(line: 63, column: 1, scope: !78)
