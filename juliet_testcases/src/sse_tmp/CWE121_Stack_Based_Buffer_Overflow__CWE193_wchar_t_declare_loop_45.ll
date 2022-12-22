; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !8
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %1 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_good() #0 !dbg !44 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #6, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #6, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_badData, align 8, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !71, metadata !DIExpression()), !dbg !73
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !73
  call void @llvm.dbg.declare(metadata i64* %i, metadata !74, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !80
  %call = call i64 @wcslen(i32* %arraydecay) #7, !dbg !81
  store i64 %call, i64* %sourceLen, align 8, !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !86
  %3 = load i64, i64* %sourceLen, align 8, !dbg !88
  %add = add i64 %3, 1, !dbg !89
  %cmp = icmp ult i64 %2, %add, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !94
  %5 = load i32, i32* %arrayidx, align 4, !dbg !94
  %6 = load i32*, i32** %data, align 8, !dbg !95
  %7 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !95
  store i32 %5, i32* %arrayidx1, align 4, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %8, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* %9), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i32* %arraydecay, i32** %data, align 8, !dbg !115
  %0 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !118
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !119
  call void @goodG2BSink(), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !122 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !125
  store i32* %0, i32** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !128
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !133
  %call = call i64 @wcslen(i32* %arraydecay) #7, !dbg !134
  store i64 %call, i64* %sourceLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !139
  %3 = load i64, i64* %sourceLen, align 8, !dbg !141
  %add = add i64 %3, 1, !dbg !142
  %cmp = icmp ult i64 %2, %add, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !147
  %5 = load i32, i32* %arrayidx, align 4, !dbg !147
  %6 = load i32*, i32** %data, align 8, !dbg !148
  %7 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !148
  store i32 %5, i32* %arrayidx1, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %8, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* %9), !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_badData", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 27, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !13, line: 74, baseType: !14)
!13 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_bad", scope: !10, file: !10, line: 48, type: !22, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 50, type: !11)
!25 = !DILocation(line: 50, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !10, line: 51, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 51, column: 13, scope: !21)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !10, line: 52, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 52, column: 13, scope: !21)
!36 = !DILocation(line: 55, column: 12, scope: !21)
!37 = !DILocation(line: 55, column: 10, scope: !21)
!38 = !DILocation(line: 56, column: 5, scope: !21)
!39 = !DILocation(line: 56, column: 13, scope: !21)
!40 = !DILocation(line: 57, column: 82, scope: !21)
!41 = !DILocation(line: 57, column: 80, scope: !21)
!42 = !DILocation(line: 58, column: 5, scope: !21)
!43 = !DILocation(line: 59, column: 1, scope: !21)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_good", scope: !10, file: !10, line: 96, type: !22, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 98, column: 5, scope: !44)
!46 = !DILocation(line: 99, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 110, type: !48, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!14, !14, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !10, line: 110, type: !14)
!54 = !DILocation(line: 110, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !10, line: 110, type: !50)
!56 = !DILocation(line: 110, column: 27, scope: !47)
!57 = !DILocation(line: 113, column: 22, scope: !47)
!58 = !DILocation(line: 113, column: 12, scope: !47)
!59 = !DILocation(line: 113, column: 5, scope: !47)
!60 = !DILocation(line: 115, column: 5, scope: !47)
!61 = !DILocation(line: 116, column: 5, scope: !47)
!62 = !DILocation(line: 117, column: 5, scope: !47)
!63 = !DILocation(line: 120, column: 5, scope: !47)
!64 = !DILocation(line: 121, column: 5, scope: !47)
!65 = !DILocation(line: 122, column: 5, scope: !47)
!66 = !DILocation(line: 124, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 31, type: !22, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !10, line: 33, type: !11)
!69 = !DILocation(line: 33, column: 15, scope: !67)
!70 = !DILocation(line: 33, column: 22, scope: !67)
!71 = !DILocalVariable(name: "source", scope: !72, file: !10, line: 35, type: !32)
!72 = distinct !DILexicalBlock(scope: !67, file: !10, line: 34, column: 5)
!73 = !DILocation(line: 35, column: 17, scope: !72)
!74 = !DILocalVariable(name: "i", scope: !72, file: !10, line: 36, type: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !13, line: 46, baseType: !76)
!76 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!77 = !DILocation(line: 36, column: 16, scope: !72)
!78 = !DILocalVariable(name: "sourceLen", scope: !72, file: !10, line: 36, type: !75)
!79 = !DILocation(line: 36, column: 19, scope: !72)
!80 = !DILocation(line: 37, column: 28, scope: !72)
!81 = !DILocation(line: 37, column: 21, scope: !72)
!82 = !DILocation(line: 37, column: 19, scope: !72)
!83 = !DILocation(line: 40, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !72, file: !10, line: 40, column: 9)
!85 = !DILocation(line: 40, column: 14, scope: !84)
!86 = !DILocation(line: 40, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !10, line: 40, column: 9)
!88 = !DILocation(line: 40, column: 25, scope: !87)
!89 = !DILocation(line: 40, column: 35, scope: !87)
!90 = !DILocation(line: 40, column: 23, scope: !87)
!91 = !DILocation(line: 40, column: 9, scope: !84)
!92 = !DILocation(line: 42, column: 30, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !10, line: 41, column: 9)
!94 = !DILocation(line: 42, column: 23, scope: !93)
!95 = !DILocation(line: 42, column: 13, scope: !93)
!96 = !DILocation(line: 42, column: 18, scope: !93)
!97 = !DILocation(line: 42, column: 21, scope: !93)
!98 = !DILocation(line: 43, column: 9, scope: !93)
!99 = !DILocation(line: 40, column: 41, scope: !87)
!100 = !DILocation(line: 40, column: 9, scope: !87)
!101 = distinct !{!101, !91, !102, !103}
!102 = !DILocation(line: 43, column: 9, scope: !84)
!103 = !{!"llvm.loop.mustprogress"}
!104 = !DILocation(line: 44, column: 20, scope: !72)
!105 = !DILocation(line: 44, column: 9, scope: !72)
!106 = !DILocation(line: 46, column: 1, scope: !67)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 83, type: !22, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !10, line: 85, type: !11)
!109 = !DILocation(line: 85, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !10, line: 86, type: !27)
!111 = !DILocation(line: 86, column: 13, scope: !107)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !10, line: 87, type: !32)
!113 = !DILocation(line: 87, column: 13, scope: !107)
!114 = !DILocation(line: 90, column: 12, scope: !107)
!115 = !DILocation(line: 90, column: 10, scope: !107)
!116 = !DILocation(line: 91, column: 5, scope: !107)
!117 = !DILocation(line: 91, column: 13, scope: !107)
!118 = !DILocation(line: 92, column: 86, scope: !107)
!119 = !DILocation(line: 92, column: 84, scope: !107)
!120 = !DILocation(line: 93, column: 5, scope: !107)
!121 = !DILocation(line: 94, column: 1, scope: !107)
!122 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 66, type: !22, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DILocalVariable(name: "data", scope: !122, file: !10, line: 68, type: !11)
!124 = !DILocation(line: 68, column: 15, scope: !122)
!125 = !DILocation(line: 68, column: 22, scope: !122)
!126 = !DILocalVariable(name: "source", scope: !127, file: !10, line: 70, type: !32)
!127 = distinct !DILexicalBlock(scope: !122, file: !10, line: 69, column: 5)
!128 = !DILocation(line: 70, column: 17, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !127, file: !10, line: 71, type: !75)
!130 = !DILocation(line: 71, column: 16, scope: !127)
!131 = !DILocalVariable(name: "sourceLen", scope: !127, file: !10, line: 71, type: !75)
!132 = !DILocation(line: 71, column: 19, scope: !127)
!133 = !DILocation(line: 72, column: 28, scope: !127)
!134 = !DILocation(line: 72, column: 21, scope: !127)
!135 = !DILocation(line: 72, column: 19, scope: !127)
!136 = !DILocation(line: 75, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !10, line: 75, column: 9)
!138 = !DILocation(line: 75, column: 14, scope: !137)
!139 = !DILocation(line: 75, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !10, line: 75, column: 9)
!141 = !DILocation(line: 75, column: 25, scope: !140)
!142 = !DILocation(line: 75, column: 35, scope: !140)
!143 = !DILocation(line: 75, column: 23, scope: !140)
!144 = !DILocation(line: 75, column: 9, scope: !137)
!145 = !DILocation(line: 77, column: 30, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !10, line: 76, column: 9)
!147 = !DILocation(line: 77, column: 23, scope: !146)
!148 = !DILocation(line: 77, column: 13, scope: !146)
!149 = !DILocation(line: 77, column: 18, scope: !146)
!150 = !DILocation(line: 77, column: 21, scope: !146)
!151 = !DILocation(line: 78, column: 9, scope: !146)
!152 = !DILocation(line: 75, column: 41, scope: !140)
!153 = !DILocation(line: 75, column: 9, scope: !140)
!154 = distinct !{!154, !144, !155, !103}
!155 = !DILocation(line: 78, column: 9, scope: !137)
!156 = !DILocation(line: 79, column: 20, scope: !127)
!157 = !DILocation(line: 79, column: 9, scope: !127)
!158 = !DILocation(line: 81, column: 1, scope: !122)
