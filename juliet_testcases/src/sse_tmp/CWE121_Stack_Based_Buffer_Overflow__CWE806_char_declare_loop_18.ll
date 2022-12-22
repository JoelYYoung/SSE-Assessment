; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  br label %source, !dbg !26

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !27), !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !30
  %1 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !44, metadata !DIExpression()), !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  %call = call i64 @strlen(i8* %3) #6, !dbg !47
  store i64 %call, i64* %dataLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %source
  %4 = load i64, i64* %i, align 8, !dbg !52
  %5 = load i64, i64* %dataLen, align 8, !dbg !54
  %cmp = icmp ult i64 %4, %5, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !57
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !57
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !57
  %9 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !61
  store i8 %8, i8* %arrayidx2, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %10, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !69
  store i8 0, i8* %arrayidx3, align 1, !dbg !70
  %11 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %11), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_18_good() #0 !dbg !74 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #7, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #7, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_18_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_18_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay, i8** %data, align 8, !dbg !102
  br label %source, !dbg !103

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !104), !dbg !105
  %0 = load i8*, i8** %data, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !107
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !115, metadata !DIExpression()), !dbg !116
  %3 = load i8*, i8** %data, align 8, !dbg !117
  %call = call i64 @strlen(i8* %3) #6, !dbg !118
  store i64 %call, i64* %dataLen, align 8, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %source
  %4 = load i64, i64* %i, align 8, !dbg !123
  %5 = load i64, i64* %dataLen, align 8, !dbg !125
  %cmp = icmp ult i64 %4, %5, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !128
  %7 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !128
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !128
  %9 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !132
  store i8 %8, i8* %arrayidx2, align 1, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %10, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !139
  store i8 0, i8* %arrayidx3, align 1, !dbg !140
  %11 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* %11), !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_18.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 12, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 28, column: 5, scope: !11)
!27 = !DILabel(scope: !11, name: "source", file: !12, line: 29)
!28 = !DILocation(line: 29, column: 1, scope: !11)
!29 = !DILocation(line: 31, column: 12, scope: !11)
!30 = !DILocation(line: 31, column: 5, scope: !11)
!31 = !DILocation(line: 32, column: 5, scope: !11)
!32 = !DILocation(line: 32, column: 17, scope: !11)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 34, type: !35)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 34, column: 14, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !12, line: 35, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 35, column: 16, scope: !34)
!44 = !DILocalVariable(name: "dataLen", scope: !34, file: !12, line: 35, type: !40)
!45 = !DILocation(line: 35, column: 19, scope: !34)
!46 = !DILocation(line: 36, column: 26, scope: !34)
!47 = !DILocation(line: 36, column: 19, scope: !34)
!48 = !DILocation(line: 36, column: 17, scope: !34)
!49 = !DILocation(line: 38, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !34, file: !12, line: 38, column: 9)
!51 = !DILocation(line: 38, column: 14, scope: !50)
!52 = !DILocation(line: 38, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 38, column: 9)
!54 = !DILocation(line: 38, column: 25, scope: !53)
!55 = !DILocation(line: 38, column: 23, scope: !53)
!56 = !DILocation(line: 38, column: 9, scope: !50)
!57 = !DILocation(line: 40, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !12, line: 39, column: 9)
!59 = !DILocation(line: 40, column: 28, scope: !58)
!60 = !DILocation(line: 40, column: 18, scope: !58)
!61 = !DILocation(line: 40, column: 13, scope: !58)
!62 = !DILocation(line: 40, column: 21, scope: !58)
!63 = !DILocation(line: 41, column: 9, scope: !58)
!64 = !DILocation(line: 38, column: 35, scope: !53)
!65 = !DILocation(line: 38, column: 9, scope: !53)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 41, column: 9, scope: !50)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 42, column: 9, scope: !34)
!70 = !DILocation(line: 42, column: 20, scope: !34)
!71 = !DILocation(line: 43, column: 19, scope: !34)
!72 = !DILocation(line: 43, column: 9, scope: !34)
!73 = !DILocation(line: 45, column: 1, scope: !11)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_18_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 78, column: 5, scope: !74)
!76 = !DILocation(line: 79, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !78, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 91, type: !80)
!83 = !DILocation(line: 91, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 91, type: !81)
!85 = !DILocation(line: 91, column: 27, scope: !77)
!86 = !DILocation(line: 94, column: 22, scope: !77)
!87 = !DILocation(line: 94, column: 12, scope: !77)
!88 = !DILocation(line: 94, column: 5, scope: !77)
!89 = !DILocation(line: 96, column: 5, scope: !77)
!90 = !DILocation(line: 97, column: 5, scope: !77)
!91 = !DILocation(line: 98, column: 5, scope: !77)
!92 = !DILocation(line: 101, column: 5, scope: !77)
!93 = !DILocation(line: 102, column: 5, scope: !77)
!94 = !DILocation(line: 103, column: 5, scope: !77)
!95 = !DILocation(line: 105, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 54, type: !16)
!98 = !DILocation(line: 54, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !12, line: 55, type: !20)
!100 = !DILocation(line: 55, column: 10, scope: !96)
!101 = !DILocation(line: 56, column: 12, scope: !96)
!102 = !DILocation(line: 56, column: 10, scope: !96)
!103 = !DILocation(line: 57, column: 5, scope: !96)
!104 = !DILabel(scope: !96, name: "source", file: !12, line: 58)
!105 = !DILocation(line: 58, column: 1, scope: !96)
!106 = !DILocation(line: 60, column: 12, scope: !96)
!107 = !DILocation(line: 60, column: 5, scope: !96)
!108 = !DILocation(line: 61, column: 5, scope: !96)
!109 = !DILocation(line: 61, column: 16, scope: !96)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !12, line: 63, type: !35)
!111 = distinct !DILexicalBlock(scope: !96, file: !12, line: 62, column: 5)
!112 = !DILocation(line: 63, column: 14, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !111, file: !12, line: 64, type: !40)
!114 = !DILocation(line: 64, column: 16, scope: !111)
!115 = !DILocalVariable(name: "dataLen", scope: !111, file: !12, line: 64, type: !40)
!116 = !DILocation(line: 64, column: 19, scope: !111)
!117 = !DILocation(line: 65, column: 26, scope: !111)
!118 = !DILocation(line: 65, column: 19, scope: !111)
!119 = !DILocation(line: 65, column: 17, scope: !111)
!120 = !DILocation(line: 67, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !12, line: 67, column: 9)
!122 = !DILocation(line: 67, column: 14, scope: !121)
!123 = !DILocation(line: 67, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 67, column: 9)
!125 = !DILocation(line: 67, column: 25, scope: !124)
!126 = !DILocation(line: 67, column: 23, scope: !124)
!127 = !DILocation(line: 67, column: 9, scope: !121)
!128 = !DILocation(line: 69, column: 23, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !12, line: 68, column: 9)
!130 = !DILocation(line: 69, column: 28, scope: !129)
!131 = !DILocation(line: 69, column: 18, scope: !129)
!132 = !DILocation(line: 69, column: 13, scope: !129)
!133 = !DILocation(line: 69, column: 21, scope: !129)
!134 = !DILocation(line: 70, column: 9, scope: !129)
!135 = !DILocation(line: 67, column: 35, scope: !124)
!136 = !DILocation(line: 67, column: 9, scope: !124)
!137 = distinct !{!137, !127, !138, !68}
!138 = !DILocation(line: 70, column: 9, scope: !121)
!139 = !DILocation(line: 71, column: 9, scope: !111)
!140 = !DILocation(line: 71, column: 20, scope: !111)
!141 = !DILocation(line: 72, column: 19, scope: !111)
!142 = !DILocation(line: 72, column: 9, scope: !111)
!143 = !DILocation(line: 74, column: 1, scope: !96)
