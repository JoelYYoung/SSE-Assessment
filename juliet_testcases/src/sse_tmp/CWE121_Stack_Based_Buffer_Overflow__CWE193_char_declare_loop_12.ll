; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay1, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx2, align 1, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !54
  store i64 %call4, i64* %sourceLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !59
  %4 = load i64, i64* %sourceLen, align 8, !dbg !61
  %add = add i64 %4, 1, !dbg !62
  %cmp = icmp ult i64 %3, %add, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !67
  %6 = load i8, i8* %arrayidx5, align 1, !dbg !67
  %7 = load i8*, i8** %data, align 8, !dbg !68
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !68
  store i8 %6, i8* %arrayidx6, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %9, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !77
  call void @printLine(i8* %10), !dbg !78
  ret void, !dbg !79
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12_good() #0 !dbg !80 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i8* %arraydecay, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !118
  store i8* %arraydecay1, i8** %data, align 8, !dbg !120
  %1 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 0, !dbg !121
  store i8 0, i8* %arrayidx2, align 1, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !130
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !131
  store i64 %call4, i64* %sourceLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !136
  %4 = load i64, i64* %sourceLen, align 8, !dbg !138
  %add = add i64 %4, 1, !dbg !139
  %cmp = icmp ult i64 %3, %add, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !144
  %6 = load i8, i8* %arrayidx5, align 1, !dbg !144
  %7 = load i8*, i8** %data, align 8, !dbg !145
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !145
  store i8 %6, i8* %arrayidx6, align 1, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %9, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !153
  call void @printLine(i8* %10), !dbg !154
  ret void, !dbg !155
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 8, scope: !11)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 34, column: 5)
!34 = !DILocation(line: 37, column: 14, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 17, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocation(line: 44, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !12, line: 41, column: 5)
!40 = !DILocation(line: 44, column: 14, scope: !39)
!41 = !DILocation(line: 45, column: 9, scope: !39)
!42 = !DILocation(line: 45, column: 17, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 48, type: !25)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 5)
!45 = !DILocation(line: 48, column: 14, scope: !44)
!46 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 49, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 49, column: 16, scope: !44)
!51 = !DILocalVariable(name: "sourceLen", scope: !44, file: !12, line: 49, type: !47)
!52 = !DILocation(line: 49, column: 19, scope: !44)
!53 = !DILocation(line: 50, column: 28, scope: !44)
!54 = !DILocation(line: 50, column: 21, scope: !44)
!55 = !DILocation(line: 50, column: 19, scope: !44)
!56 = !DILocation(line: 53, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !44, file: !12, line: 53, column: 9)
!58 = !DILocation(line: 53, column: 14, scope: !57)
!59 = !DILocation(line: 53, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 53, column: 9)
!61 = !DILocation(line: 53, column: 25, scope: !60)
!62 = !DILocation(line: 53, column: 35, scope: !60)
!63 = !DILocation(line: 53, column: 23, scope: !60)
!64 = !DILocation(line: 53, column: 9, scope: !57)
!65 = !DILocation(line: 55, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !12, line: 54, column: 9)
!67 = !DILocation(line: 55, column: 23, scope: !66)
!68 = !DILocation(line: 55, column: 13, scope: !66)
!69 = !DILocation(line: 55, column: 18, scope: !66)
!70 = !DILocation(line: 55, column: 21, scope: !66)
!71 = !DILocation(line: 56, column: 9, scope: !66)
!72 = !DILocation(line: 53, column: 41, scope: !60)
!73 = !DILocation(line: 53, column: 9, scope: !60)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 56, column: 9, scope: !57)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 57, column: 19, scope: !44)
!78 = !DILocation(line: 57, column: 9, scope: !44)
!79 = !DILocation(line: 59, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_12_good", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 102, column: 5, scope: !80)
!82 = !DILocation(line: 103, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 115, type: !84, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86, !87}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 115, type: !86)
!89 = !DILocation(line: 115, column: 14, scope: !83)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 115, type: !87)
!91 = !DILocation(line: 115, column: 27, scope: !83)
!92 = !DILocation(line: 118, column: 22, scope: !83)
!93 = !DILocation(line: 118, column: 12, scope: !83)
!94 = !DILocation(line: 118, column: 5, scope: !83)
!95 = !DILocation(line: 120, column: 5, scope: !83)
!96 = !DILocation(line: 121, column: 5, scope: !83)
!97 = !DILocation(line: 122, column: 5, scope: !83)
!98 = !DILocation(line: 125, column: 5, scope: !83)
!99 = !DILocation(line: 126, column: 5, scope: !83)
!100 = !DILocation(line: 127, column: 5, scope: !83)
!101 = !DILocation(line: 129, column: 5, scope: !83)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 69, type: !16)
!104 = !DILocation(line: 69, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !12, line: 70, type: !20)
!106 = !DILocation(line: 70, column: 10, scope: !102)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !12, line: 71, type: !25)
!108 = !DILocation(line: 71, column: 10, scope: !102)
!109 = !DILocation(line: 72, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !12, line: 72, column: 8)
!111 = !DILocation(line: 72, column: 8, scope: !102)
!112 = !DILocation(line: 76, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 73, column: 5)
!114 = !DILocation(line: 76, column: 14, scope: !113)
!115 = !DILocation(line: 77, column: 9, scope: !113)
!116 = !DILocation(line: 77, column: 17, scope: !113)
!117 = !DILocation(line: 78, column: 5, scope: !113)
!118 = !DILocation(line: 83, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !110, file: !12, line: 80, column: 5)
!120 = !DILocation(line: 83, column: 14, scope: !119)
!121 = !DILocation(line: 84, column: 9, scope: !119)
!122 = !DILocation(line: 84, column: 17, scope: !119)
!123 = !DILocalVariable(name: "source", scope: !124, file: !12, line: 87, type: !25)
!124 = distinct !DILexicalBlock(scope: !102, file: !12, line: 86, column: 5)
!125 = !DILocation(line: 87, column: 14, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 88, type: !47)
!127 = !DILocation(line: 88, column: 16, scope: !124)
!128 = !DILocalVariable(name: "sourceLen", scope: !124, file: !12, line: 88, type: !47)
!129 = !DILocation(line: 88, column: 19, scope: !124)
!130 = !DILocation(line: 89, column: 28, scope: !124)
!131 = !DILocation(line: 89, column: 21, scope: !124)
!132 = !DILocation(line: 89, column: 19, scope: !124)
!133 = !DILocation(line: 92, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !12, line: 92, column: 9)
!135 = !DILocation(line: 92, column: 14, scope: !134)
!136 = !DILocation(line: 92, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 92, column: 9)
!138 = !DILocation(line: 92, column: 25, scope: !137)
!139 = !DILocation(line: 92, column: 35, scope: !137)
!140 = !DILocation(line: 92, column: 23, scope: !137)
!141 = !DILocation(line: 92, column: 9, scope: !134)
!142 = !DILocation(line: 94, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !12, line: 93, column: 9)
!144 = !DILocation(line: 94, column: 23, scope: !143)
!145 = !DILocation(line: 94, column: 13, scope: !143)
!146 = !DILocation(line: 94, column: 18, scope: !143)
!147 = !DILocation(line: 94, column: 21, scope: !143)
!148 = !DILocation(line: 95, column: 9, scope: !143)
!149 = !DILocation(line: 92, column: 41, scope: !137)
!150 = !DILocation(line: 92, column: 9, scope: !137)
!151 = distinct !{!151, !141, !152, !76}
!152 = !DILocation(line: 95, column: 9, scope: !134)
!153 = !DILocation(line: 96, column: 19, scope: !124)
!154 = !DILocation(line: 96, column: 9, scope: !124)
!155 = !DILocation(line: 98, column: 1, scope: !102)
