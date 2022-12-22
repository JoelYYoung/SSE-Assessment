; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 11, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  call void %4(i8* %5), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !54
  store i64 %call, i64* %sourceLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !59
  %2 = load i64, i64* %sourceLen, align 8, !dbg !61
  %add = add i64 %2, 1, !dbg !62
  %cmp = icmp ult i64 %1, %add, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !67
  %4 = load i8, i8* %arrayidx, align 1, !dbg !67
  %5 = load i8*, i8** %data.addr, align 8, !dbg !68
  %6 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !68
  store i8 %4, i8* %arrayidx1, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %7, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !77
  call void @printLine(i8* %8), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_44_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_44_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_44_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !105, metadata !DIExpression()), !dbg !106
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 10, align 16, !dbg !109
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %1 = alloca i8, i64 11, align 16, !dbg !112
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !111
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !113
  store i8* %2, i8** %data, align 8, !dbg !114
  %3 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !117
  %5 = load i8*, i8** %data, align 8, !dbg !118
  call void %4(i8* %5), !dbg !117
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !120 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !130
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !131
  store i64 %call, i64* %sourceLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !136
  %2 = load i64, i64* %sourceLen, align 8, !dbg !138
  %add = add i64 %2, 1, !dbg !139
  %cmp = icmp ult i64 %1, %add, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !144
  %4 = load i8, i8* %arrayidx, align 1, !dbg !144
  %5 = load i8*, i8** %data.addr, align 8, !dbg !145
  %6 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !145
  store i8 %4, i8* %arrayidx1, align 1, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %7, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !153
  call void @printLine(i8* %8), !dbg !154
  ret void, !dbg !155
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_44.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_44_bad", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_44.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 46, type: !4)
!18 = !DILocation(line: 46, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 48, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 48, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 49, type: !4)
!25 = !DILocation(line: 49, column: 12, scope: !13)
!26 = !DILocation(line: 49, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 50, type: !4)
!28 = !DILocation(line: 50, column: 12, scope: !13)
!29 = !DILocation(line: 50, column: 37, scope: !13)
!30 = !DILocation(line: 53, column: 12, scope: !13)
!31 = !DILocation(line: 53, column: 10, scope: !13)
!32 = !DILocation(line: 54, column: 5, scope: !13)
!33 = !DILocation(line: 54, column: 13, scope: !13)
!34 = !DILocation(line: 56, column: 5, scope: !13)
!35 = !DILocation(line: 56, column: 13, scope: !13)
!36 = !DILocation(line: 57, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 28, type: !21, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !14, line: 28, type: !4)
!39 = !DILocation(line: 28, column: 28, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !14, line: 31, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 30, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 31, column: 14, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !14, line: 32, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 32, column: 16, scope: !41)
!51 = !DILocalVariable(name: "sourceLen", scope: !41, file: !14, line: 32, type: !47)
!52 = !DILocation(line: 32, column: 19, scope: !41)
!53 = !DILocation(line: 33, column: 28, scope: !41)
!54 = !DILocation(line: 33, column: 21, scope: !41)
!55 = !DILocation(line: 33, column: 19, scope: !41)
!56 = !DILocation(line: 36, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !41, file: !14, line: 36, column: 9)
!58 = !DILocation(line: 36, column: 14, scope: !57)
!59 = !DILocation(line: 36, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !14, line: 36, column: 9)
!61 = !DILocation(line: 36, column: 25, scope: !60)
!62 = !DILocation(line: 36, column: 35, scope: !60)
!63 = !DILocation(line: 36, column: 23, scope: !60)
!64 = !DILocation(line: 36, column: 9, scope: !57)
!65 = !DILocation(line: 38, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !14, line: 37, column: 9)
!67 = !DILocation(line: 38, column: 23, scope: !66)
!68 = !DILocation(line: 38, column: 13, scope: !66)
!69 = !DILocation(line: 38, column: 18, scope: !66)
!70 = !DILocation(line: 38, column: 21, scope: !66)
!71 = !DILocation(line: 39, column: 9, scope: !66)
!72 = !DILocation(line: 36, column: 41, scope: !60)
!73 = !DILocation(line: 36, column: 9, scope: !60)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 39, column: 9, scope: !57)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 40, column: 19, scope: !41)
!78 = !DILocation(line: 40, column: 9, scope: !41)
!79 = !DILocation(line: 42, column: 1, scope: !37)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_44_good", scope: !14, file: !14, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 95, column: 5, scope: !80)
!82 = !DILocation(line: 96, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 107, type: !84, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86, !87}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !14, line: 107, type: !86)
!89 = !DILocation(line: 107, column: 14, scope: !83)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !14, line: 107, type: !87)
!91 = !DILocation(line: 107, column: 27, scope: !83)
!92 = !DILocation(line: 110, column: 22, scope: !83)
!93 = !DILocation(line: 110, column: 12, scope: !83)
!94 = !DILocation(line: 110, column: 5, scope: !83)
!95 = !DILocation(line: 112, column: 5, scope: !83)
!96 = !DILocation(line: 113, column: 5, scope: !83)
!97 = !DILocation(line: 114, column: 5, scope: !83)
!98 = !DILocation(line: 117, column: 5, scope: !83)
!99 = !DILocation(line: 118, column: 5, scope: !83)
!100 = !DILocation(line: 119, column: 5, scope: !83)
!101 = !DILocation(line: 121, column: 5, scope: !83)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !14, line: 82, type: !4)
!104 = !DILocation(line: 82, column: 12, scope: !102)
!105 = !DILocalVariable(name: "funcPtr", scope: !102, file: !14, line: 83, type: !20)
!106 = !DILocation(line: 83, column: 12, scope: !102)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !14, line: 84, type: !4)
!108 = !DILocation(line: 84, column: 12, scope: !102)
!109 = !DILocation(line: 84, column: 36, scope: !102)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !14, line: 85, type: !4)
!111 = !DILocation(line: 85, column: 12, scope: !102)
!112 = !DILocation(line: 85, column: 37, scope: !102)
!113 = !DILocation(line: 88, column: 12, scope: !102)
!114 = !DILocation(line: 88, column: 10, scope: !102)
!115 = !DILocation(line: 89, column: 5, scope: !102)
!116 = !DILocation(line: 89, column: 13, scope: !102)
!117 = !DILocation(line: 90, column: 5, scope: !102)
!118 = !DILocation(line: 90, column: 13, scope: !102)
!119 = !DILocation(line: 91, column: 1, scope: !102)
!120 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 64, type: !21, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", arg: 1, scope: !120, file: !14, line: 64, type: !4)
!122 = !DILocation(line: 64, column: 32, scope: !120)
!123 = !DILocalVariable(name: "source", scope: !124, file: !14, line: 67, type: !42)
!124 = distinct !DILexicalBlock(scope: !120, file: !14, line: 66, column: 5)
!125 = !DILocation(line: 67, column: 14, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !14, line: 68, type: !47)
!127 = !DILocation(line: 68, column: 16, scope: !124)
!128 = !DILocalVariable(name: "sourceLen", scope: !124, file: !14, line: 68, type: !47)
!129 = !DILocation(line: 68, column: 19, scope: !124)
!130 = !DILocation(line: 69, column: 28, scope: !124)
!131 = !DILocation(line: 69, column: 21, scope: !124)
!132 = !DILocation(line: 69, column: 19, scope: !124)
!133 = !DILocation(line: 72, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !14, line: 72, column: 9)
!135 = !DILocation(line: 72, column: 14, scope: !134)
!136 = !DILocation(line: 72, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !14, line: 72, column: 9)
!138 = !DILocation(line: 72, column: 25, scope: !137)
!139 = !DILocation(line: 72, column: 35, scope: !137)
!140 = !DILocation(line: 72, column: 23, scope: !137)
!141 = !DILocation(line: 72, column: 9, scope: !134)
!142 = !DILocation(line: 74, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !14, line: 73, column: 9)
!144 = !DILocation(line: 74, column: 23, scope: !143)
!145 = !DILocation(line: 74, column: 13, scope: !143)
!146 = !DILocation(line: 74, column: 18, scope: !143)
!147 = !DILocation(line: 74, column: 21, scope: !143)
!148 = !DILocation(line: 75, column: 9, scope: !143)
!149 = !DILocation(line: 72, column: 41, scope: !137)
!150 = !DILocation(line: 72, column: 9, scope: !137)
!151 = distinct !{!151, !141, !152, !76}
!152 = !DILocation(line: 75, column: 9, scope: !134)
!153 = !DILocation(line: 76, column: 19, scope: !124)
!154 = !DILocation(line: 76, column: 9, scope: !124)
!155 = !DILocation(line: 78, column: 1, scope: !120)
