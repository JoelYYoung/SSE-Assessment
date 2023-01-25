; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  call void %1(i8* %2), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !52, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !55
  store i64 %call, i64* %sourceLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !60
  %2 = load i64, i64* %sourceLen, align 8, !dbg !62
  %add = add i64 %2, 1, !dbg !63
  %cmp = icmp ult i64 %1, %add, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !68
  %4 = load i8, i8* %arrayidx, align 1, !dbg !68
  %5 = load i8*, i8** %data.addr, align 8, !dbg !69
  %6 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !69
  store i8 %4, i8* %arrayidx1, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %7, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !78
  call void @printLine(i8* %8), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_44_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_44_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_44_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
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
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !106, metadata !DIExpression()), !dbg !107
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i8* %arraydecay, i8** %data, align 8, !dbg !113
  %0 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !116
  %2 = load i8*, i8** %data, align 8, !dbg !117
  call void %1(i8* %2), !dbg !116
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !119 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !129
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !130
  store i64 %call, i64* %sourceLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !135
  %2 = load i64, i64* %sourceLen, align 8, !dbg !137
  %add = add i64 %2, 1, !dbg !138
  %cmp = icmp ult i64 %1, %add, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !143
  %4 = load i8, i8* %arrayidx, align 1, !dbg !143
  %5 = load i8*, i8** %data.addr, align 8, !dbg !144
  %6 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !144
  store i8 %4, i8* %arrayidx1, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %7, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !152
  call void @printLine(i8* %8), !dbg !153
  ret void, !dbg !154
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_44_bad", scope: !12, file: !12, line: 44, type: !13, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 46, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 46, column: 12, scope: !11)
!19 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 48, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !16}
!23 = !DILocation(line: 48, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 49, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 49, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 50, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 50, column: 10, scope: !11)
!34 = !DILocation(line: 53, column: 12, scope: !11)
!35 = !DILocation(line: 53, column: 10, scope: !11)
!36 = !DILocation(line: 54, column: 5, scope: !11)
!37 = !DILocation(line: 54, column: 13, scope: !11)
!38 = !DILocation(line: 56, column: 5, scope: !11)
!39 = !DILocation(line: 56, column: 13, scope: !11)
!40 = !DILocation(line: 57, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 28, type: !21, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !12, line: 28, type: !16)
!43 = !DILocation(line: 28, column: 28, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 31, type: !30)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 30, column: 5)
!46 = !DILocation(line: 31, column: 14, scope: !45)
!47 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 32, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 32, column: 16, scope: !45)
!52 = !DILocalVariable(name: "sourceLen", scope: !45, file: !12, line: 32, type: !48)
!53 = !DILocation(line: 32, column: 19, scope: !45)
!54 = !DILocation(line: 33, column: 28, scope: !45)
!55 = !DILocation(line: 33, column: 21, scope: !45)
!56 = !DILocation(line: 33, column: 19, scope: !45)
!57 = !DILocation(line: 36, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !45, file: !12, line: 36, column: 9)
!59 = !DILocation(line: 36, column: 14, scope: !58)
!60 = !DILocation(line: 36, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 36, column: 9)
!62 = !DILocation(line: 36, column: 25, scope: !61)
!63 = !DILocation(line: 36, column: 35, scope: !61)
!64 = !DILocation(line: 36, column: 23, scope: !61)
!65 = !DILocation(line: 36, column: 9, scope: !58)
!66 = !DILocation(line: 38, column: 30, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !12, line: 37, column: 9)
!68 = !DILocation(line: 38, column: 23, scope: !67)
!69 = !DILocation(line: 38, column: 13, scope: !67)
!70 = !DILocation(line: 38, column: 18, scope: !67)
!71 = !DILocation(line: 38, column: 21, scope: !67)
!72 = !DILocation(line: 39, column: 9, scope: !67)
!73 = !DILocation(line: 36, column: 41, scope: !61)
!74 = !DILocation(line: 36, column: 9, scope: !61)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 39, column: 9, scope: !58)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 40, column: 19, scope: !45)
!79 = !DILocation(line: 40, column: 9, scope: !45)
!80 = !DILocation(line: 42, column: 1, scope: !41)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_44_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 95, column: 5, scope: !81)
!83 = !DILocation(line: 96, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !85, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 107, type: !87)
!90 = !DILocation(line: 107, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 107, type: !88)
!92 = !DILocation(line: 107, column: 27, scope: !84)
!93 = !DILocation(line: 110, column: 22, scope: !84)
!94 = !DILocation(line: 110, column: 12, scope: !84)
!95 = !DILocation(line: 110, column: 5, scope: !84)
!96 = !DILocation(line: 112, column: 5, scope: !84)
!97 = !DILocation(line: 113, column: 5, scope: !84)
!98 = !DILocation(line: 114, column: 5, scope: !84)
!99 = !DILocation(line: 117, column: 5, scope: !84)
!100 = !DILocation(line: 118, column: 5, scope: !84)
!101 = !DILocation(line: 119, column: 5, scope: !84)
!102 = !DILocation(line: 121, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 82, type: !16)
!105 = !DILocation(line: 82, column: 12, scope: !103)
!106 = !DILocalVariable(name: "funcPtr", scope: !103, file: !12, line: 83, type: !20)
!107 = !DILocation(line: 83, column: 12, scope: !103)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 84, type: !25)
!109 = !DILocation(line: 84, column: 10, scope: !103)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 85, type: !30)
!111 = !DILocation(line: 85, column: 10, scope: !103)
!112 = !DILocation(line: 88, column: 12, scope: !103)
!113 = !DILocation(line: 88, column: 10, scope: !103)
!114 = !DILocation(line: 89, column: 5, scope: !103)
!115 = !DILocation(line: 89, column: 13, scope: !103)
!116 = !DILocation(line: 90, column: 5, scope: !103)
!117 = !DILocation(line: 90, column: 13, scope: !103)
!118 = !DILocation(line: 91, column: 1, scope: !103)
!119 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 64, type: !21, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", arg: 1, scope: !119, file: !12, line: 64, type: !16)
!121 = !DILocation(line: 64, column: 32, scope: !119)
!122 = !DILocalVariable(name: "source", scope: !123, file: !12, line: 67, type: !30)
!123 = distinct !DILexicalBlock(scope: !119, file: !12, line: 66, column: 5)
!124 = !DILocation(line: 67, column: 14, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !12, line: 68, type: !48)
!126 = !DILocation(line: 68, column: 16, scope: !123)
!127 = !DILocalVariable(name: "sourceLen", scope: !123, file: !12, line: 68, type: !48)
!128 = !DILocation(line: 68, column: 19, scope: !123)
!129 = !DILocation(line: 69, column: 28, scope: !123)
!130 = !DILocation(line: 69, column: 21, scope: !123)
!131 = !DILocation(line: 69, column: 19, scope: !123)
!132 = !DILocation(line: 72, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !12, line: 72, column: 9)
!134 = !DILocation(line: 72, column: 14, scope: !133)
!135 = !DILocation(line: 72, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 72, column: 9)
!137 = !DILocation(line: 72, column: 25, scope: !136)
!138 = !DILocation(line: 72, column: 35, scope: !136)
!139 = !DILocation(line: 72, column: 23, scope: !136)
!140 = !DILocation(line: 72, column: 9, scope: !133)
!141 = !DILocation(line: 74, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !12, line: 73, column: 9)
!143 = !DILocation(line: 74, column: 23, scope: !142)
!144 = !DILocation(line: 74, column: 13, scope: !142)
!145 = !DILocation(line: 74, column: 18, scope: !142)
!146 = !DILocation(line: 74, column: 21, scope: !142)
!147 = !DILocation(line: 75, column: 9, scope: !142)
!148 = !DILocation(line: 72, column: 41, scope: !136)
!149 = !DILocation(line: 72, column: 9, scope: !136)
!150 = distinct !{!150, !140, !151, !77}
!151 = !DILocation(line: 75, column: 9, scope: !133)
!152 = !DILocation(line: 76, column: 19, scope: !123)
!153 = !DILocation(line: 76, column: 9, scope: !123)
!154 = !DILocation(line: 78, column: 1, scope: !119)
