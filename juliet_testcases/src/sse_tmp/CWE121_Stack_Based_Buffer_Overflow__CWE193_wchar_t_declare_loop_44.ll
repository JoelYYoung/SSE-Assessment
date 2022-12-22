; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %1 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !40
  %2 = load i32*, i32** %data, align 8, !dbg !41
  call void %1(i32* %2), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !48
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !55
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !56
  store i64 %call, i64* %sourceLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !61
  %2 = load i64, i64* %sourceLen, align 8, !dbg !63
  %add = add i64 %2, 1, !dbg !64
  %cmp = icmp ult i64 %1, %add, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !69
  %4 = load i32, i32* %arrayidx, align 4, !dbg !69
  %5 = load i32*, i32** %data.addr, align 8, !dbg !70
  %6 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !70
  store i32 %4, i32* %arrayidx1, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %7, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !79
  call void @printWLine(i32* %8), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_44_good() #0 !dbg !82 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #7, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #7, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_44_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_44_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !108, metadata !DIExpression()), !dbg !109
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i32* %arraydecay, i32** %data, align 8, !dbg !115
  %0 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %1 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !118
  %2 = load i32*, i32** %data, align 8, !dbg !119
  call void %1(i32* %2), !dbg !118
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !121 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !131
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !132
  store i64 %call, i64* %sourceLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !137
  %2 = load i64, i64* %sourceLen, align 8, !dbg !139
  %add = add i64 %2, 1, !dbg !140
  %cmp = icmp ult i64 %1, %add, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !145
  %4 = load i32, i32* %arrayidx, align 4, !dbg !145
  %5 = load i32*, i32** %data.addr, align 8, !dbg !146
  %6 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !146
  store i32 %4, i32* %arrayidx1, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %7, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !154
  call void @printWLine(i32* %8), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_44_bad", scope: !12, file: !12, line: 44, type: !13, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 46, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 46, column: 15, scope: !11)
!21 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 48, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !16}
!25 = !DILocation(line: 48, column: 12, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 49, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 49, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 50, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 50, column: 13, scope: !11)
!36 = !DILocation(line: 53, column: 12, scope: !11)
!37 = !DILocation(line: 53, column: 10, scope: !11)
!38 = !DILocation(line: 54, column: 5, scope: !11)
!39 = !DILocation(line: 54, column: 13, scope: !11)
!40 = !DILocation(line: 56, column: 5, scope: !11)
!41 = !DILocation(line: 56, column: 13, scope: !11)
!42 = !DILocation(line: 57, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 28, type: !23, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !12, line: 28, type: !16)
!45 = !DILocation(line: 28, column: 31, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !12, line: 31, type: !32)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 30, column: 5)
!48 = !DILocation(line: 31, column: 17, scope: !47)
!49 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 32, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 32, column: 16, scope: !47)
!53 = !DILocalVariable(name: "sourceLen", scope: !47, file: !12, line: 32, type: !50)
!54 = !DILocation(line: 32, column: 19, scope: !47)
!55 = !DILocation(line: 33, column: 28, scope: !47)
!56 = !DILocation(line: 33, column: 21, scope: !47)
!57 = !DILocation(line: 33, column: 19, scope: !47)
!58 = !DILocation(line: 36, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !47, file: !12, line: 36, column: 9)
!60 = !DILocation(line: 36, column: 14, scope: !59)
!61 = !DILocation(line: 36, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 36, column: 9)
!63 = !DILocation(line: 36, column: 25, scope: !62)
!64 = !DILocation(line: 36, column: 35, scope: !62)
!65 = !DILocation(line: 36, column: 23, scope: !62)
!66 = !DILocation(line: 36, column: 9, scope: !59)
!67 = !DILocation(line: 38, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !12, line: 37, column: 9)
!69 = !DILocation(line: 38, column: 23, scope: !68)
!70 = !DILocation(line: 38, column: 13, scope: !68)
!71 = !DILocation(line: 38, column: 18, scope: !68)
!72 = !DILocation(line: 38, column: 21, scope: !68)
!73 = !DILocation(line: 39, column: 9, scope: !68)
!74 = !DILocation(line: 36, column: 41, scope: !62)
!75 = !DILocation(line: 36, column: 9, scope: !62)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 39, column: 9, scope: !59)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 40, column: 20, scope: !47)
!80 = !DILocation(line: 40, column: 9, scope: !47)
!81 = !DILocation(line: 42, column: 1, scope: !43)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_44_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 95, column: 5, scope: !82)
!84 = !DILocation(line: 96, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !86, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!19, !19, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 107, type: !19)
!92 = !DILocation(line: 107, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 107, type: !88)
!94 = !DILocation(line: 107, column: 27, scope: !85)
!95 = !DILocation(line: 110, column: 22, scope: !85)
!96 = !DILocation(line: 110, column: 12, scope: !85)
!97 = !DILocation(line: 110, column: 5, scope: !85)
!98 = !DILocation(line: 112, column: 5, scope: !85)
!99 = !DILocation(line: 113, column: 5, scope: !85)
!100 = !DILocation(line: 114, column: 5, scope: !85)
!101 = !DILocation(line: 117, column: 5, scope: !85)
!102 = !DILocation(line: 118, column: 5, scope: !85)
!103 = !DILocation(line: 119, column: 5, scope: !85)
!104 = !DILocation(line: 121, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 82, type: !16)
!107 = !DILocation(line: 82, column: 15, scope: !105)
!108 = !DILocalVariable(name: "funcPtr", scope: !105, file: !12, line: 83, type: !22)
!109 = !DILocation(line: 83, column: 12, scope: !105)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !12, line: 84, type: !27)
!111 = !DILocation(line: 84, column: 13, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !12, line: 85, type: !32)
!113 = !DILocation(line: 85, column: 13, scope: !105)
!114 = !DILocation(line: 88, column: 12, scope: !105)
!115 = !DILocation(line: 88, column: 10, scope: !105)
!116 = !DILocation(line: 89, column: 5, scope: !105)
!117 = !DILocation(line: 89, column: 13, scope: !105)
!118 = !DILocation(line: 90, column: 5, scope: !105)
!119 = !DILocation(line: 90, column: 13, scope: !105)
!120 = !DILocation(line: 91, column: 1, scope: !105)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 64, type: !23, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", arg: 1, scope: !121, file: !12, line: 64, type: !16)
!123 = !DILocation(line: 64, column: 35, scope: !121)
!124 = !DILocalVariable(name: "source", scope: !125, file: !12, line: 67, type: !32)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 66, column: 5)
!126 = !DILocation(line: 67, column: 17, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !12, line: 68, type: !50)
!128 = !DILocation(line: 68, column: 16, scope: !125)
!129 = !DILocalVariable(name: "sourceLen", scope: !125, file: !12, line: 68, type: !50)
!130 = !DILocation(line: 68, column: 19, scope: !125)
!131 = !DILocation(line: 69, column: 28, scope: !125)
!132 = !DILocation(line: 69, column: 21, scope: !125)
!133 = !DILocation(line: 69, column: 19, scope: !125)
!134 = !DILocation(line: 72, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !12, line: 72, column: 9)
!136 = !DILocation(line: 72, column: 14, scope: !135)
!137 = !DILocation(line: 72, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 72, column: 9)
!139 = !DILocation(line: 72, column: 25, scope: !138)
!140 = !DILocation(line: 72, column: 35, scope: !138)
!141 = !DILocation(line: 72, column: 23, scope: !138)
!142 = !DILocation(line: 72, column: 9, scope: !135)
!143 = !DILocation(line: 74, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !12, line: 73, column: 9)
!145 = !DILocation(line: 74, column: 23, scope: !144)
!146 = !DILocation(line: 74, column: 13, scope: !144)
!147 = !DILocation(line: 74, column: 18, scope: !144)
!148 = !DILocation(line: 74, column: 21, scope: !144)
!149 = !DILocation(line: 75, column: 9, scope: !144)
!150 = !DILocation(line: 72, column: 41, scope: !138)
!151 = !DILocation(line: 72, column: 9, scope: !138)
!152 = distinct !{!152, !142, !153, !78}
!153 = !DILocation(line: 75, column: 9, scope: !135)
!154 = !DILocation(line: 76, column: 20, scope: !125)
!155 = !DILocation(line: 76, column: 9, scope: !125)
!156 = !DILocation(line: 78, column: 1, scope: !121)
