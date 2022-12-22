; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source1 = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  br label %source, !dbg !31

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !32), !dbg !33
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [11 x i32]* %source1, metadata !38, metadata !DIExpression()), !dbg !40
  %1 = bitcast [11 x i32]* %source1 to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18_bad.source to i8*), i64 44, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !47
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !48
  store i64 %call, i64* %sourceLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %source
  %2 = load i64, i64* %i, align 8, !dbg !53
  %3 = load i64, i64* %sourceLen, align 8, !dbg !55
  %add = add i64 %3, 1, !dbg !56
  %cmp = icmp ult i64 %2, %add, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 %4, !dbg !61
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !61
  %6 = load i32*, i32** %data, align 8, !dbg !62
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !62
  store i32 %5, i32* %arrayidx4, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %8, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !71
  call void @printWLine(i32* %9), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source1 = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  br label %source, !dbg !104

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !105), !dbg !106
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay, i32** %data, align 8, !dbg !108
  %0 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [11 x i32]* %source1, metadata !111, metadata !DIExpression()), !dbg !113
  %1 = bitcast [11 x i32]* %source1 to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !118
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !119
  store i64 %call, i64* %sourceLen, align 8, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %source
  %2 = load i64, i64* %i, align 8, !dbg !124
  %3 = load i64, i64* %sourceLen, align 8, !dbg !126
  %add = add i64 %3, 1, !dbg !127
  %cmp = icmp ult i64 %2, %add, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 %4, !dbg !132
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !133
  %7 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !133
  store i32 %5, i32* %arrayidx4, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %8, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !141
  call void @printWLine(i32* %9), !dbg !142
  ret void, !dbg !143
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 33, column: 5, scope: !11)
!32 = !DILabel(scope: !11, name: "source", file: !12, line: 34)
!33 = !DILocation(line: 34, column: 1, scope: !11)
!34 = !DILocation(line: 37, column: 12, scope: !11)
!35 = !DILocation(line: 37, column: 10, scope: !11)
!36 = !DILocation(line: 38, column: 5, scope: !11)
!37 = !DILocation(line: 38, column: 13, scope: !11)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 40, type: !27)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!40 = !DILocation(line: 40, column: 17, scope: !39)
!41 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 41, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 41, column: 16, scope: !39)
!45 = !DILocalVariable(name: "sourceLen", scope: !39, file: !12, line: 41, type: !42)
!46 = !DILocation(line: 41, column: 19, scope: !39)
!47 = !DILocation(line: 42, column: 28, scope: !39)
!48 = !DILocation(line: 42, column: 21, scope: !39)
!49 = !DILocation(line: 42, column: 19, scope: !39)
!50 = !DILocation(line: 45, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !39, file: !12, line: 45, column: 9)
!52 = !DILocation(line: 45, column: 14, scope: !51)
!53 = !DILocation(line: 45, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !12, line: 45, column: 9)
!55 = !DILocation(line: 45, column: 25, scope: !54)
!56 = !DILocation(line: 45, column: 35, scope: !54)
!57 = !DILocation(line: 45, column: 23, scope: !54)
!58 = !DILocation(line: 45, column: 9, scope: !51)
!59 = !DILocation(line: 47, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !12, line: 46, column: 9)
!61 = !DILocation(line: 47, column: 23, scope: !60)
!62 = !DILocation(line: 47, column: 13, scope: !60)
!63 = !DILocation(line: 47, column: 18, scope: !60)
!64 = !DILocation(line: 47, column: 21, scope: !60)
!65 = !DILocation(line: 48, column: 9, scope: !60)
!66 = !DILocation(line: 45, column: 41, scope: !54)
!67 = !DILocation(line: 45, column: 9, scope: !54)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 48, column: 9, scope: !51)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 49, column: 20, scope: !39)
!72 = !DILocation(line: 49, column: 9, scope: !39)
!73 = !DILocation(line: 51, column: 1, scope: !11)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_18_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 85, column: 5, scope: !74)
!76 = !DILocation(line: 86, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !78, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!19, !19, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 98, type: !19)
!84 = !DILocation(line: 98, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 98, type: !80)
!86 = !DILocation(line: 98, column: 27, scope: !77)
!87 = !DILocation(line: 101, column: 22, scope: !77)
!88 = !DILocation(line: 101, column: 12, scope: !77)
!89 = !DILocation(line: 101, column: 5, scope: !77)
!90 = !DILocation(line: 103, column: 5, scope: !77)
!91 = !DILocation(line: 104, column: 5, scope: !77)
!92 = !DILocation(line: 105, column: 5, scope: !77)
!93 = !DILocation(line: 108, column: 5, scope: !77)
!94 = !DILocation(line: 109, column: 5, scope: !77)
!95 = !DILocation(line: 110, column: 5, scope: !77)
!96 = !DILocation(line: 112, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 60, type: !16)
!99 = !DILocation(line: 60, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !12, line: 61, type: !22)
!101 = !DILocation(line: 61, column: 13, scope: !97)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !12, line: 62, type: !27)
!103 = !DILocation(line: 62, column: 13, scope: !97)
!104 = !DILocation(line: 63, column: 5, scope: !97)
!105 = !DILabel(scope: !97, name: "source", file: !12, line: 64)
!106 = !DILocation(line: 64, column: 1, scope: !97)
!107 = !DILocation(line: 67, column: 12, scope: !97)
!108 = !DILocation(line: 67, column: 10, scope: !97)
!109 = !DILocation(line: 68, column: 5, scope: !97)
!110 = !DILocation(line: 68, column: 13, scope: !97)
!111 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 70, type: !27)
!112 = distinct !DILexicalBlock(scope: !97, file: !12, line: 69, column: 5)
!113 = !DILocation(line: 70, column: 17, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !112, file: !12, line: 71, type: !42)
!115 = !DILocation(line: 71, column: 16, scope: !112)
!116 = !DILocalVariable(name: "sourceLen", scope: !112, file: !12, line: 71, type: !42)
!117 = !DILocation(line: 71, column: 19, scope: !112)
!118 = !DILocation(line: 72, column: 28, scope: !112)
!119 = !DILocation(line: 72, column: 21, scope: !112)
!120 = !DILocation(line: 72, column: 19, scope: !112)
!121 = !DILocation(line: 75, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !112, file: !12, line: 75, column: 9)
!123 = !DILocation(line: 75, column: 14, scope: !122)
!124 = !DILocation(line: 75, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 75, column: 9)
!126 = !DILocation(line: 75, column: 25, scope: !125)
!127 = !DILocation(line: 75, column: 35, scope: !125)
!128 = !DILocation(line: 75, column: 23, scope: !125)
!129 = !DILocation(line: 75, column: 9, scope: !122)
!130 = !DILocation(line: 77, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !12, line: 76, column: 9)
!132 = !DILocation(line: 77, column: 23, scope: !131)
!133 = !DILocation(line: 77, column: 13, scope: !131)
!134 = !DILocation(line: 77, column: 18, scope: !131)
!135 = !DILocation(line: 77, column: 21, scope: !131)
!136 = !DILocation(line: 78, column: 9, scope: !131)
!137 = !DILocation(line: 75, column: 41, scope: !125)
!138 = !DILocation(line: 75, column: 9, scope: !125)
!139 = distinct !{!139, !129, !140, !70}
!140 = !DILocation(line: 78, column: 9, scope: !122)
!141 = !DILocation(line: 79, column: 20, scope: !112)
!142 = !DILocation(line: 79, column: 9, scope: !112)
!143 = !DILocation(line: 81, column: 1, scope: !97)
