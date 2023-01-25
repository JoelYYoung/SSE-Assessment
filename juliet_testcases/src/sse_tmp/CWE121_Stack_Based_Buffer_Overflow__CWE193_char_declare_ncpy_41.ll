; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_badSink(i8* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !24
  %1 = load i8*, i8** %data.addr, align 8, !dbg !25
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !26
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !27
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !28
  %add = add i64 %call, 1, !dbg !29
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay, i64 %add) #7, !dbg !30
  %2 = load i8*, i8** %data.addr, align 8, !dbg !31
  call void @printLine(i8* %2), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_bad() #0 !dbg !34 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !46
  store i8* %arraydecay, i8** %data, align 8, !dbg !47
  %0 = load i8*, i8** %data, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %1 = load i8*, i8** %data, align 8, !dbg !50
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_badSink(i8* %1), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_goodG2BSink(i8* %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !56, metadata !DIExpression()), !dbg !58
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !58
  %1 = load i8*, i8** %data.addr, align 8, !dbg !59
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !60
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !61
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !62
  %add = add i64 %call, 1, !dbg !63
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay, i64 %add) #7, !dbg !64
  %2 = load i8*, i8** %data.addr, align 8, !dbg !65
  call void @printLine(i8* %2), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #7, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #7, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !97
  store i8* %arraydecay, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %1 = load i8*, i8** %data, align 8, !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_goodG2BSink(i8* %1), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_badSink", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 28, type: !15)
!18 = !DILocation(line: 28, column: 85, scope: !11)
!19 = !DILocalVariable(name: "source", scope: !20, file: !12, line: 31, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 88, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 11)
!24 = !DILocation(line: 31, column: 14, scope: !20)
!25 = !DILocation(line: 34, column: 17, scope: !20)
!26 = !DILocation(line: 34, column: 23, scope: !20)
!27 = !DILocation(line: 34, column: 38, scope: !20)
!28 = !DILocation(line: 34, column: 31, scope: !20)
!29 = !DILocation(line: 34, column: 46, scope: !20)
!30 = !DILocation(line: 34, column: 9, scope: !20)
!31 = !DILocation(line: 35, column: 19, scope: !20)
!32 = !DILocation(line: 35, column: 9, scope: !20)
!33 = !DILocation(line: 37, column: 1, scope: !11)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_bad", scope: !12, file: !12, line: 39, type: !35, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null}
!37 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 41, type: !15)
!38 = !DILocation(line: 41, column: 12, scope: !34)
!39 = !DILocalVariable(name: "dataBadBuffer", scope: !34, file: !12, line: 42, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 10)
!43 = !DILocation(line: 42, column: 10, scope: !34)
!44 = !DILocalVariable(name: "dataGoodBuffer", scope: !34, file: !12, line: 43, type: !21)
!45 = !DILocation(line: 43, column: 10, scope: !34)
!46 = !DILocation(line: 46, column: 12, scope: !34)
!47 = !DILocation(line: 46, column: 10, scope: !34)
!48 = !DILocation(line: 47, column: 5, scope: !34)
!49 = !DILocation(line: 47, column: 13, scope: !34)
!50 = !DILocation(line: 48, column: 77, scope: !34)
!51 = !DILocation(line: 48, column: 5, scope: !34)
!52 = !DILocation(line: 49, column: 1, scope: !34)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_goodG2BSink", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !12, line: 55, type: !15)
!55 = !DILocation(line: 55, column: 89, scope: !53)
!56 = !DILocalVariable(name: "source", scope: !57, file: !12, line: 58, type: !21)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 57, column: 5)
!58 = !DILocation(line: 58, column: 14, scope: !57)
!59 = !DILocation(line: 61, column: 17, scope: !57)
!60 = !DILocation(line: 61, column: 23, scope: !57)
!61 = !DILocation(line: 61, column: 38, scope: !57)
!62 = !DILocation(line: 61, column: 31, scope: !57)
!63 = !DILocation(line: 61, column: 46, scope: !57)
!64 = !DILocation(line: 61, column: 9, scope: !57)
!65 = !DILocation(line: 62, column: 19, scope: !57)
!66 = !DILocation(line: 62, column: 9, scope: !57)
!67 = !DILocation(line: 64, column: 1, scope: !53)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_41_good", scope: !12, file: !12, line: 79, type: !35, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 81, column: 5, scope: !68)
!70 = !DILocation(line: 82, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !72, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !12, line: 94, type: !74)
!77 = !DILocation(line: 94, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !12, line: 94, type: !75)
!79 = !DILocation(line: 94, column: 27, scope: !71)
!80 = !DILocation(line: 97, column: 22, scope: !71)
!81 = !DILocation(line: 97, column: 12, scope: !71)
!82 = !DILocation(line: 97, column: 5, scope: !71)
!83 = !DILocation(line: 99, column: 5, scope: !71)
!84 = !DILocation(line: 100, column: 5, scope: !71)
!85 = !DILocation(line: 101, column: 5, scope: !71)
!86 = !DILocation(line: 104, column: 5, scope: !71)
!87 = !DILocation(line: 105, column: 5, scope: !71)
!88 = !DILocation(line: 106, column: 5, scope: !71)
!89 = !DILocation(line: 108, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !35, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 69, type: !15)
!92 = !DILocation(line: 69, column: 12, scope: !90)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !12, line: 70, type: !40)
!94 = !DILocation(line: 70, column: 10, scope: !90)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !12, line: 71, type: !21)
!96 = !DILocation(line: 71, column: 10, scope: !90)
!97 = !DILocation(line: 74, column: 12, scope: !90)
!98 = !DILocation(line: 74, column: 10, scope: !90)
!99 = !DILocation(line: 75, column: 5, scope: !90)
!100 = !DILocation(line: 75, column: 13, scope: !90)
!101 = !DILocation(line: 76, column: 81, scope: !90)
!102 = !DILocation(line: 76, column: 5, scope: !90)
!103 = !DILocation(line: 77, column: 1, scope: !90)
