; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.else, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %2, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  store i8* %4, i8** %data, align 8, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 0, !dbg !37
  store i8 0, i8* %arrayidx1, align 1, !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !52
  %call2 = call i64 @strlen(i8* %arraydecay) #6, !dbg !53
  store i64 %call2, i64* %sourceLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !58
  %8 = load i64, i64* %sourceLen, align 8, !dbg !60
  %add = add i64 %8, 1, !dbg !61
  %cmp = icmp ult i64 %7, %add, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !66
  %10 = load i8, i8* %arrayidx3, align 1, !dbg !66
  %11 = load i8*, i8** %data, align 8, !dbg !67
  %12 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !67
  store i8 %10, i8* %arrayidx4, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %13, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %14), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12_good() #0 !dbg !79 {
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
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 10, align 16, !dbg !106
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %1 = alloca i8, i64 11, align 16, !dbg !109
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !108
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !113
  store i8* %2, i8** %data, align 8, !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !119
  store i8* %4, i8** %data, align 8, !dbg !121
  %5 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 0, !dbg !122
  store i8 0, i8* %arrayidx1, align 1, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !131
  %call2 = call i64 @strlen(i8* %arraydecay) #6, !dbg !132
  store i64 %call2, i64* %sourceLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !137
  %8 = load i64, i64* %sourceLen, align 8, !dbg !139
  %add = add i64 %8, 1, !dbg !140
  %cmp = icmp ult i64 %7, %add, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !145
  %10 = load i8, i8* %arrayidx3, align 1, !dbg !145
  %11 = load i8*, i8** %data, align 8, !dbg !146
  %12 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx4 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !146
  store i8 %10, i8* %arrayidx4, align 1, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %13, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !154
  call void @printLine(i8* %14), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 8, scope: !13)
!28 = !DILocation(line: 37, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 34, column: 5)
!30 = !DILocation(line: 37, column: 14, scope: !29)
!31 = !DILocation(line: 38, column: 9, scope: !29)
!32 = !DILocation(line: 38, column: 17, scope: !29)
!33 = !DILocation(line: 39, column: 5, scope: !29)
!34 = !DILocation(line: 44, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !26, file: !14, line: 41, column: 5)
!36 = !DILocation(line: 44, column: 14, scope: !35)
!37 = !DILocation(line: 45, column: 9, scope: !35)
!38 = !DILocation(line: 45, column: 17, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !40, file: !14, line: 48, type: !41)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 47, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 48, column: 14, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !14, line: 49, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 49, column: 16, scope: !40)
!50 = !DILocalVariable(name: "sourceLen", scope: !40, file: !14, line: 49, type: !46)
!51 = !DILocation(line: 49, column: 19, scope: !40)
!52 = !DILocation(line: 50, column: 28, scope: !40)
!53 = !DILocation(line: 50, column: 21, scope: !40)
!54 = !DILocation(line: 50, column: 19, scope: !40)
!55 = !DILocation(line: 53, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !14, line: 53, column: 9)
!57 = !DILocation(line: 53, column: 14, scope: !56)
!58 = !DILocation(line: 53, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !14, line: 53, column: 9)
!60 = !DILocation(line: 53, column: 25, scope: !59)
!61 = !DILocation(line: 53, column: 35, scope: !59)
!62 = !DILocation(line: 53, column: 23, scope: !59)
!63 = !DILocation(line: 53, column: 9, scope: !56)
!64 = !DILocation(line: 55, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !14, line: 54, column: 9)
!66 = !DILocation(line: 55, column: 23, scope: !65)
!67 = !DILocation(line: 55, column: 13, scope: !65)
!68 = !DILocation(line: 55, column: 18, scope: !65)
!69 = !DILocation(line: 55, column: 21, scope: !65)
!70 = !DILocation(line: 56, column: 9, scope: !65)
!71 = !DILocation(line: 53, column: 41, scope: !59)
!72 = !DILocation(line: 53, column: 9, scope: !59)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 56, column: 9, scope: !56)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 57, column: 19, scope: !40)
!77 = !DILocation(line: 57, column: 9, scope: !40)
!78 = !DILocation(line: 59, column: 1, scope: !13)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_12_good", scope: !14, file: !14, line: 100, type: !15, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 102, column: 5, scope: !79)
!81 = !DILocation(line: 103, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 115, type: !83, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !14, line: 115, type: !85)
!88 = !DILocation(line: 115, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !14, line: 115, type: !86)
!90 = !DILocation(line: 115, column: 27, scope: !82)
!91 = !DILocation(line: 118, column: 22, scope: !82)
!92 = !DILocation(line: 118, column: 12, scope: !82)
!93 = !DILocation(line: 118, column: 5, scope: !82)
!94 = !DILocation(line: 120, column: 5, scope: !82)
!95 = !DILocation(line: 121, column: 5, scope: !82)
!96 = !DILocation(line: 122, column: 5, scope: !82)
!97 = !DILocation(line: 125, column: 5, scope: !82)
!98 = !DILocation(line: 126, column: 5, scope: !82)
!99 = !DILocation(line: 127, column: 5, scope: !82)
!100 = !DILocation(line: 129, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 69, type: !4)
!103 = !DILocation(line: 69, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !14, line: 70, type: !4)
!105 = !DILocation(line: 70, column: 12, scope: !101)
!106 = !DILocation(line: 70, column: 36, scope: !101)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !14, line: 71, type: !4)
!108 = !DILocation(line: 71, column: 12, scope: !101)
!109 = !DILocation(line: 71, column: 37, scope: !101)
!110 = !DILocation(line: 72, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !101, file: !14, line: 72, column: 8)
!112 = !DILocation(line: 72, column: 8, scope: !101)
!113 = !DILocation(line: 76, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !14, line: 73, column: 5)
!115 = !DILocation(line: 76, column: 14, scope: !114)
!116 = !DILocation(line: 77, column: 9, scope: !114)
!117 = !DILocation(line: 77, column: 17, scope: !114)
!118 = !DILocation(line: 78, column: 5, scope: !114)
!119 = !DILocation(line: 83, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !111, file: !14, line: 80, column: 5)
!121 = !DILocation(line: 83, column: 14, scope: !120)
!122 = !DILocation(line: 84, column: 9, scope: !120)
!123 = !DILocation(line: 84, column: 17, scope: !120)
!124 = !DILocalVariable(name: "source", scope: !125, file: !14, line: 87, type: !41)
!125 = distinct !DILexicalBlock(scope: !101, file: !14, line: 86, column: 5)
!126 = !DILocation(line: 87, column: 14, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !14, line: 88, type: !46)
!128 = !DILocation(line: 88, column: 16, scope: !125)
!129 = !DILocalVariable(name: "sourceLen", scope: !125, file: !14, line: 88, type: !46)
!130 = !DILocation(line: 88, column: 19, scope: !125)
!131 = !DILocation(line: 89, column: 28, scope: !125)
!132 = !DILocation(line: 89, column: 21, scope: !125)
!133 = !DILocation(line: 89, column: 19, scope: !125)
!134 = !DILocation(line: 92, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !14, line: 92, column: 9)
!136 = !DILocation(line: 92, column: 14, scope: !135)
!137 = !DILocation(line: 92, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !14, line: 92, column: 9)
!139 = !DILocation(line: 92, column: 25, scope: !138)
!140 = !DILocation(line: 92, column: 35, scope: !138)
!141 = !DILocation(line: 92, column: 23, scope: !138)
!142 = !DILocation(line: 92, column: 9, scope: !135)
!143 = !DILocation(line: 94, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !14, line: 93, column: 9)
!145 = !DILocation(line: 94, column: 23, scope: !144)
!146 = !DILocation(line: 94, column: 13, scope: !144)
!147 = !DILocation(line: 94, column: 18, scope: !144)
!148 = !DILocation(line: 94, column: 21, scope: !144)
!149 = !DILocation(line: 95, column: 9, scope: !144)
!150 = !DILocation(line: 92, column: 41, scope: !138)
!151 = !DILocation(line: 92, column: 9, scope: !138)
!152 = distinct !{!152, !142, !153, !75}
!153 = !DILocation(line: 95, column: 9, scope: !135)
!154 = !DILocation(line: 96, column: 19, scope: !125)
!155 = !DILocation(line: 96, column: 9, scope: !125)
!156 = !DILocation(line: 98, column: 1, scope: !101)
