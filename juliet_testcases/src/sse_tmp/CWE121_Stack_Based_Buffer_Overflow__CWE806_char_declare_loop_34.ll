; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !34
  %1 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !38
  store i8* %2, i8** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !43
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !43
  store i8* %3, i8** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !55, metadata !DIExpression()), !dbg !56
  %5 = load i8*, i8** %data1, align 8, !dbg !57
  %call = call i64 @strlen(i8* %5) #6, !dbg !58
  store i64 %call, i64* %dataLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !63
  %7 = load i64, i64* %dataLen, align 8, !dbg !65
  %cmp = icmp ult i64 %6, %7, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data1, align 8, !dbg !68
  %9 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !68
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !68
  %11 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !72
  store i8 %10, i8* %arrayidx3, align 1, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %12, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !80
  store i8 0, i8* %arrayidx4, align 1, !dbg !81
  %13 = load i8*, i8** %data1, align 8, !dbg !82
  call void @printLine(i8* %13), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_bad(), !dbg !104
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
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !114
  store i8* %arraydecay, i8** %data, align 8, !dbg !115
  %0 = load i8*, i8** %data, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !117
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %2 = load i8*, i8** %data, align 8, !dbg !120
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !121
  store i8* %2, i8** %unionFirst, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !123, metadata !DIExpression()), !dbg !125
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !126
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !126
  store i8* %3, i8** %data1, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !132, metadata !DIExpression()), !dbg !133
  %5 = load i8*, i8** %data1, align 8, !dbg !134
  %call = call i64 @strlen(i8* %5) #6, !dbg !135
  store i64 %call, i64* %dataLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !140
  %7 = load i64, i64* %dataLen, align 8, !dbg !142
  %cmp = icmp ult i64 %6, %7, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data1, align 8, !dbg !145
  %9 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !145
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !145
  %11 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !149
  store i8 %10, i8* %arrayidx3, align 1, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %12, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !156
  store i8 0, i8* %arrayidx4, align 1, !dbg !157
  %13 = load i8*, i8** %data1, align 8, !dbg !158
  call void @printLine(i8* %13), !dbg !159
  ret void, !dbg !160
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType", file: !12, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 23, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 24, baseType: !16, size: 64)
!25 = !DILocation(line: 32, column: 79, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 10, scope: !11)
!31 = !DILocation(line: 34, column: 12, scope: !11)
!32 = !DILocation(line: 34, column: 10, scope: !11)
!33 = !DILocation(line: 36, column: 12, scope: !11)
!34 = !DILocation(line: 36, column: 5, scope: !11)
!35 = !DILocation(line: 37, column: 5, scope: !11)
!36 = !DILocation(line: 37, column: 17, scope: !11)
!37 = !DILocation(line: 38, column: 26, scope: !11)
!38 = !DILocation(line: 38, column: 13, scope: !11)
!39 = !DILocation(line: 38, column: 24, scope: !11)
!40 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 40, type: !16)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!42 = !DILocation(line: 40, column: 16, scope: !41)
!43 = !DILocation(line: 40, column: 31, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 41, column: 9)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 42, column: 18, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 43, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 43, column: 20, scope: !45)
!55 = !DILocalVariable(name: "dataLen", scope: !45, file: !12, line: 43, type: !51)
!56 = !DILocation(line: 43, column: 23, scope: !45)
!57 = !DILocation(line: 44, column: 30, scope: !45)
!58 = !DILocation(line: 44, column: 23, scope: !45)
!59 = !DILocation(line: 44, column: 21, scope: !45)
!60 = !DILocation(line: 46, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !45, file: !12, line: 46, column: 13)
!62 = !DILocation(line: 46, column: 18, scope: !61)
!63 = !DILocation(line: 46, column: 25, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !12, line: 46, column: 13)
!65 = !DILocation(line: 46, column: 29, scope: !64)
!66 = !DILocation(line: 46, column: 27, scope: !64)
!67 = !DILocation(line: 46, column: 13, scope: !61)
!68 = !DILocation(line: 48, column: 27, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !12, line: 47, column: 13)
!70 = !DILocation(line: 48, column: 32, scope: !69)
!71 = !DILocation(line: 48, column: 22, scope: !69)
!72 = !DILocation(line: 48, column: 17, scope: !69)
!73 = !DILocation(line: 48, column: 25, scope: !69)
!74 = !DILocation(line: 49, column: 13, scope: !69)
!75 = !DILocation(line: 46, column: 39, scope: !64)
!76 = !DILocation(line: 46, column: 13, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 49, column: 13, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 50, column: 13, scope: !45)
!81 = !DILocation(line: 50, column: 24, scope: !45)
!82 = !DILocation(line: 51, column: 23, scope: !45)
!83 = !DILocation(line: 51, column: 13, scope: !45)
!84 = !DILocation(line: 54, column: 1, scope: !11)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_good", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 90, column: 5, scope: !85)
!87 = !DILocation(line: 91, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !89, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !12, line: 102, type: !91)
!94 = !DILocation(line: 102, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !12, line: 102, type: !92)
!96 = !DILocation(line: 102, column: 27, scope: !88)
!97 = !DILocation(line: 105, column: 22, scope: !88)
!98 = !DILocation(line: 105, column: 12, scope: !88)
!99 = !DILocation(line: 105, column: 5, scope: !88)
!100 = !DILocation(line: 107, column: 5, scope: !88)
!101 = !DILocation(line: 108, column: 5, scope: !88)
!102 = !DILocation(line: 109, column: 5, scope: !88)
!103 = !DILocation(line: 112, column: 5, scope: !88)
!104 = !DILocation(line: 113, column: 5, scope: !88)
!105 = !DILocation(line: 114, column: 5, scope: !88)
!106 = !DILocation(line: 116, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 63, type: !16)
!109 = !DILocation(line: 63, column: 12, scope: !107)
!110 = !DILocalVariable(name: "myUnion", scope: !107, file: !12, line: 64, type: !20)
!111 = !DILocation(line: 64, column: 79, scope: !107)
!112 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !12, line: 65, type: !27)
!113 = !DILocation(line: 65, column: 10, scope: !107)
!114 = !DILocation(line: 66, column: 12, scope: !107)
!115 = !DILocation(line: 66, column: 10, scope: !107)
!116 = !DILocation(line: 68, column: 12, scope: !107)
!117 = !DILocation(line: 68, column: 5, scope: !107)
!118 = !DILocation(line: 69, column: 5, scope: !107)
!119 = !DILocation(line: 69, column: 16, scope: !107)
!120 = !DILocation(line: 70, column: 26, scope: !107)
!121 = !DILocation(line: 70, column: 13, scope: !107)
!122 = !DILocation(line: 70, column: 24, scope: !107)
!123 = !DILocalVariable(name: "data", scope: !124, file: !12, line: 72, type: !16)
!124 = distinct !DILexicalBlock(scope: !107, file: !12, line: 71, column: 5)
!125 = !DILocation(line: 72, column: 16, scope: !124)
!126 = !DILocation(line: 72, column: 31, scope: !124)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !12, line: 74, type: !46)
!128 = distinct !DILexicalBlock(scope: !124, file: !12, line: 73, column: 9)
!129 = !DILocation(line: 74, column: 18, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !12, line: 75, type: !51)
!131 = !DILocation(line: 75, column: 20, scope: !128)
!132 = !DILocalVariable(name: "dataLen", scope: !128, file: !12, line: 75, type: !51)
!133 = !DILocation(line: 75, column: 23, scope: !128)
!134 = !DILocation(line: 76, column: 30, scope: !128)
!135 = !DILocation(line: 76, column: 23, scope: !128)
!136 = !DILocation(line: 76, column: 21, scope: !128)
!137 = !DILocation(line: 78, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !12, line: 78, column: 13)
!139 = !DILocation(line: 78, column: 18, scope: !138)
!140 = !DILocation(line: 78, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !12, line: 78, column: 13)
!142 = !DILocation(line: 78, column: 29, scope: !141)
!143 = !DILocation(line: 78, column: 27, scope: !141)
!144 = !DILocation(line: 78, column: 13, scope: !138)
!145 = !DILocation(line: 80, column: 27, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !12, line: 79, column: 13)
!147 = !DILocation(line: 80, column: 32, scope: !146)
!148 = !DILocation(line: 80, column: 22, scope: !146)
!149 = !DILocation(line: 80, column: 17, scope: !146)
!150 = !DILocation(line: 80, column: 25, scope: !146)
!151 = !DILocation(line: 81, column: 13, scope: !146)
!152 = !DILocation(line: 78, column: 39, scope: !141)
!153 = !DILocation(line: 78, column: 13, scope: !141)
!154 = distinct !{!154, !144, !155, !79}
!155 = !DILocation(line: 81, column: 13, scope: !138)
!156 = !DILocation(line: 82, column: 13, scope: !128)
!157 = !DILocation(line: 82, column: 24, scope: !128)
!158 = !DILocation(line: 83, column: 23, scope: !128)
!159 = !DILocation(line: 83, column: 13, scope: !128)
!160 = !DILocation(line: 86, column: 1, scope: !107)
