; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i1 = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %0, 1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay, i8** %data, align 8, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %2, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !50, metadata !DIExpression()), !dbg !52
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !53, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !58, metadata !DIExpression()), !dbg !59
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !60
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !61
  store i64 %call, i64* %sourceLen, align 8, !dbg !62
  store i64 0, i64* %i1, align 8, !dbg !63
  br label %for.cond3, !dbg !65

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i1, align 8, !dbg !66
  %5 = load i64, i64* %sourceLen, align 8, !dbg !68
  %add = add i64 %5, 1, !dbg !69
  %cmp4 = icmp ult i64 %4, %add, !dbg !70
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !71

for.body5:                                        ; preds = %for.cond3
  %6 = load i64, i64* %i1, align 8, !dbg !72
  %arrayidx6 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !74
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !74
  %8 = load i8*, i8** %data, align 8, !dbg !75
  %9 = load i64, i64* %i1, align 8, !dbg !76
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !75
  store i8 %7, i8* %arrayidx7, align 1, !dbg !77
  br label %for.inc8, !dbg !78

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i1, align 8, !dbg !79
  %inc9 = add i64 %10, 1, !dbg !79
  store i64 %inc9, i64* %i1, align 8, !dbg !79
  br label %for.cond3, !dbg !80, !llvm.loop !81

for.end10:                                        ; preds = %for.cond3
  %11 = load i8*, i8** %data, align 8, !dbg !83
  call void @printLine(i8* %11), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 0, i32* %h, align 4, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !119
  %cmp = icmp slt i32 %0, 1, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  store i8* %arraydecay, i8** %data, align 8, !dbg !125
  %1 = load i8*, i8** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !126
  store i8 0, i8* %arrayidx, align 1, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !129
  %inc = add nsw i32 %2, 1, !dbg !129
  store i32 %inc, i32* %h, align 4, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !135
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !140
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !141
  store i64 %call, i64* %sourceLen, align 8, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond2, !dbg !145

for.cond2:                                        ; preds = %for.inc7, %for.end
  %4 = load i64, i64* %i, align 8, !dbg !146
  %5 = load i64, i64* %sourceLen, align 8, !dbg !148
  %add = add i64 %5, 1, !dbg !149
  %cmp3 = icmp ult i64 %4, %add, !dbg !150
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !151

for.body4:                                        ; preds = %for.cond2
  %6 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx5 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !154
  %7 = load i8, i8* %arrayidx5, align 1, !dbg !154
  %8 = load i8*, i8** %data, align 8, !dbg !155
  %9 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !155
  store i8 %7, i8* %arrayidx6, align 1, !dbg !157
  br label %for.inc7, !dbg !158

for.inc7:                                         ; preds = %for.body4
  %10 = load i64, i64* %i, align 8, !dbg !159
  %inc8 = add i64 %10, 1, !dbg !159
  store i64 %inc8, i64* %i, align 8, !dbg !159
  br label %for.cond2, !dbg !160, !llvm.loop !161

for.end9:                                         ; preds = %for.cond2
  %11 = load i8*, i8** %data, align 8, !dbg !163
  call void @printLine(i8* %11), !dbg !164
  ret void, !dbg !165
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 31, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 32, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 80, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 32, column: 10, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 33, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 88, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 11)
!31 = !DILocation(line: 33, column: 10, scope: !11)
!32 = !DILocation(line: 34, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!34 = !DILocation(line: 34, column: 9, scope: !33)
!35 = !DILocation(line: 34, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 34, column: 5)
!37 = !DILocation(line: 34, column: 18, scope: !36)
!38 = !DILocation(line: 34, column: 5, scope: !33)
!39 = !DILocation(line: 38, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 35, column: 5)
!41 = !DILocation(line: 38, column: 14, scope: !40)
!42 = !DILocation(line: 39, column: 9, scope: !40)
!43 = !DILocation(line: 39, column: 17, scope: !40)
!44 = !DILocation(line: 40, column: 5, scope: !40)
!45 = !DILocation(line: 34, column: 24, scope: !36)
!46 = !DILocation(line: 34, column: 5, scope: !36)
!47 = distinct !{!47, !38, !48, !49}
!48 = !DILocation(line: 40, column: 5, scope: !33)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "source", scope: !51, file: !12, line: 42, type: !28)
!51 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!52 = !DILocation(line: 42, column: 14, scope: !51)
!53 = !DILocalVariable(name: "i", scope: !51, file: !12, line: 43, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 43, column: 16, scope: !51)
!58 = !DILocalVariable(name: "sourceLen", scope: !51, file: !12, line: 43, type: !54)
!59 = !DILocation(line: 43, column: 19, scope: !51)
!60 = !DILocation(line: 44, column: 28, scope: !51)
!61 = !DILocation(line: 44, column: 21, scope: !51)
!62 = !DILocation(line: 44, column: 19, scope: !51)
!63 = !DILocation(line: 47, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !51, file: !12, line: 47, column: 9)
!65 = !DILocation(line: 47, column: 14, scope: !64)
!66 = !DILocation(line: 47, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !12, line: 47, column: 9)
!68 = !DILocation(line: 47, column: 25, scope: !67)
!69 = !DILocation(line: 47, column: 35, scope: !67)
!70 = !DILocation(line: 47, column: 23, scope: !67)
!71 = !DILocation(line: 47, column: 9, scope: !64)
!72 = !DILocation(line: 49, column: 30, scope: !73)
!73 = distinct !DILexicalBlock(scope: !67, file: !12, line: 48, column: 9)
!74 = !DILocation(line: 49, column: 23, scope: !73)
!75 = !DILocation(line: 49, column: 13, scope: !73)
!76 = !DILocation(line: 49, column: 18, scope: !73)
!77 = !DILocation(line: 49, column: 21, scope: !73)
!78 = !DILocation(line: 50, column: 9, scope: !73)
!79 = !DILocation(line: 47, column: 41, scope: !67)
!80 = !DILocation(line: 47, column: 9, scope: !67)
!81 = distinct !{!81, !71, !82, !49}
!82 = !DILocation(line: 50, column: 9, scope: !64)
!83 = !DILocation(line: 51, column: 19, scope: !51)
!84 = !DILocation(line: 51, column: 9, scope: !51)
!85 = !DILocation(line: 53, column: 1, scope: !11)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 89, column: 5, scope: !86)
!88 = !DILocation(line: 90, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !90, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!16, !16, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !12, line: 102, type: !16)
!94 = !DILocation(line: 102, column: 14, scope: !89)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !12, line: 102, type: !92)
!96 = !DILocation(line: 102, column: 27, scope: !89)
!97 = !DILocation(line: 105, column: 22, scope: !89)
!98 = !DILocation(line: 105, column: 12, scope: !89)
!99 = !DILocation(line: 105, column: 5, scope: !89)
!100 = !DILocation(line: 107, column: 5, scope: !89)
!101 = !DILocation(line: 108, column: 5, scope: !89)
!102 = !DILocation(line: 109, column: 5, scope: !89)
!103 = !DILocation(line: 112, column: 5, scope: !89)
!104 = !DILocation(line: 113, column: 5, scope: !89)
!105 = !DILocation(line: 114, column: 5, scope: !89)
!106 = !DILocation(line: 116, column: 5, scope: !89)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "h", scope: !107, file: !12, line: 62, type: !16)
!109 = !DILocation(line: 62, column: 9, scope: !107)
!110 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 63, type: !19)
!111 = !DILocation(line: 63, column: 12, scope: !107)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !12, line: 64, type: !23)
!113 = !DILocation(line: 64, column: 10, scope: !107)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !12, line: 65, type: !28)
!115 = !DILocation(line: 65, column: 10, scope: !107)
!116 = !DILocation(line: 66, column: 11, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !12, line: 66, column: 5)
!118 = !DILocation(line: 66, column: 9, scope: !117)
!119 = !DILocation(line: 66, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 66, column: 5)
!121 = !DILocation(line: 66, column: 18, scope: !120)
!122 = !DILocation(line: 66, column: 5, scope: !117)
!123 = !DILocation(line: 70, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 67, column: 5)
!125 = !DILocation(line: 70, column: 14, scope: !124)
!126 = !DILocation(line: 71, column: 9, scope: !124)
!127 = !DILocation(line: 71, column: 17, scope: !124)
!128 = !DILocation(line: 72, column: 5, scope: !124)
!129 = !DILocation(line: 66, column: 24, scope: !120)
!130 = !DILocation(line: 66, column: 5, scope: !120)
!131 = distinct !{!131, !122, !132, !49}
!132 = !DILocation(line: 72, column: 5, scope: !117)
!133 = !DILocalVariable(name: "source", scope: !134, file: !12, line: 74, type: !28)
!134 = distinct !DILexicalBlock(scope: !107, file: !12, line: 73, column: 5)
!135 = !DILocation(line: 74, column: 14, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !134, file: !12, line: 75, type: !54)
!137 = !DILocation(line: 75, column: 16, scope: !134)
!138 = !DILocalVariable(name: "sourceLen", scope: !134, file: !12, line: 75, type: !54)
!139 = !DILocation(line: 75, column: 19, scope: !134)
!140 = !DILocation(line: 76, column: 28, scope: !134)
!141 = !DILocation(line: 76, column: 21, scope: !134)
!142 = !DILocation(line: 76, column: 19, scope: !134)
!143 = !DILocation(line: 79, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !134, file: !12, line: 79, column: 9)
!145 = !DILocation(line: 79, column: 14, scope: !144)
!146 = !DILocation(line: 79, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 79, column: 9)
!148 = !DILocation(line: 79, column: 25, scope: !147)
!149 = !DILocation(line: 79, column: 35, scope: !147)
!150 = !DILocation(line: 79, column: 23, scope: !147)
!151 = !DILocation(line: 79, column: 9, scope: !144)
!152 = !DILocation(line: 81, column: 30, scope: !153)
!153 = distinct !DILexicalBlock(scope: !147, file: !12, line: 80, column: 9)
!154 = !DILocation(line: 81, column: 23, scope: !153)
!155 = !DILocation(line: 81, column: 13, scope: !153)
!156 = !DILocation(line: 81, column: 18, scope: !153)
!157 = !DILocation(line: 81, column: 21, scope: !153)
!158 = !DILocation(line: 82, column: 9, scope: !153)
!159 = !DILocation(line: 79, column: 41, scope: !147)
!160 = !DILocation(line: 79, column: 9, scope: !147)
!161 = distinct !{!161, !151, !162, !49}
!162 = !DILocation(line: 82, column: 9, scope: !144)
!163 = !DILocation(line: 83, column: 19, scope: !134)
!164 = !DILocation(line: 83, column: 9, scope: !134)
!165 = !DILocation(line: 85, column: 1, scope: !107)
