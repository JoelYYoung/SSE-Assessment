; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_badSink(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !25
  %1 = load i8*, i8** %data.addr, align 8, !dbg !26
  %2 = load i8*, i8** %data.addr, align 8, !dbg !27
  %call = call i64 @strlen(i8* %2) #7, !dbg !28
  %mul = mul i64 %call, 1, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %1, i64 %mul, i1 false), !dbg !25
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %3 = load i8*, i8** %data.addr, align 8, !dbg !32
  call void @printLine(i8* %3), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_bad() #0 !dbg !35 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = alloca i8, i64 100, align 16, !dbg !42
  store i8* %0, i8** %dataBuffer, align 8, !dbg !41
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !43
  store i8* %1, i8** %data, align 8, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_badSink(i8* %4), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_goodG2BSink(i8* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !57
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !57
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !58
  %1 = load i8*, i8** %data.addr, align 8, !dbg !59
  %2 = load i8*, i8** %data.addr, align 8, !dbg !60
  %call = call i64 @strlen(i8* %2) #7, !dbg !61
  %mul = mul i64 %call, 1, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %1, i64 %mul, i1 false), !dbg !58
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !63
  store i8 0, i8* %arrayidx, align 1, !dbg !64
  %3 = load i8*, i8** %data.addr, align 8, !dbg !65
  call void @printLine(i8* %3), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_good() #0 !dbg !68 {
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
  %call = call i64 @time(i64* null) #8, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #8, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 100, align 16, !dbg !95
  store i8* %0, i8** %dataBuffer, align 8, !dbg !94
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  store i8* %1, i8** %data, align 8, !dbg !97
  %2 = load i8*, i8** %data, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_goodG2BSink(i8* %4), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 86, scope: !13)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !14, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocation(line: 28, column: 9, scope: !20)
!26 = !DILocation(line: 28, column: 22, scope: !20)
!27 = !DILocation(line: 28, column: 35, scope: !20)
!28 = !DILocation(line: 28, column: 28, scope: !20)
!29 = !DILocation(line: 28, column: 40, scope: !20)
!30 = !DILocation(line: 29, column: 9, scope: !20)
!31 = !DILocation(line: 29, column: 20, scope: !20)
!32 = !DILocation(line: 30, column: 19, scope: !20)
!33 = !DILocation(line: 30, column: 9, scope: !20)
!34 = !DILocation(line: 32, column: 1, scope: !13)
!35 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_bad", scope: !14, file: !14, line: 34, type: !36, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "data", scope: !35, file: !14, line: 36, type: !4)
!39 = !DILocation(line: 36, column: 12, scope: !35)
!40 = !DILocalVariable(name: "dataBuffer", scope: !35, file: !14, line: 37, type: !4)
!41 = !DILocation(line: 37, column: 12, scope: !35)
!42 = !DILocation(line: 37, column: 33, scope: !35)
!43 = !DILocation(line: 38, column: 12, scope: !35)
!44 = !DILocation(line: 38, column: 10, scope: !35)
!45 = !DILocation(line: 40, column: 12, scope: !35)
!46 = !DILocation(line: 40, column: 5, scope: !35)
!47 = !DILocation(line: 41, column: 5, scope: !35)
!48 = !DILocation(line: 41, column: 17, scope: !35)
!49 = !DILocation(line: 42, column: 78, scope: !35)
!50 = !DILocation(line: 42, column: 5, scope: !35)
!51 = !DILocation(line: 43, column: 1, scope: !35)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_goodG2BSink", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !14, line: 49, type: !4)
!54 = !DILocation(line: 49, column: 90, scope: !52)
!55 = !DILocalVariable(name: "dest", scope: !56, file: !14, line: 52, type: !21)
!56 = distinct !DILexicalBlock(scope: !52, file: !14, line: 51, column: 5)
!57 = !DILocation(line: 52, column: 14, scope: !56)
!58 = !DILocation(line: 54, column: 9, scope: !56)
!59 = !DILocation(line: 54, column: 22, scope: !56)
!60 = !DILocation(line: 54, column: 35, scope: !56)
!61 = !DILocation(line: 54, column: 28, scope: !56)
!62 = !DILocation(line: 54, column: 40, scope: !56)
!63 = !DILocation(line: 55, column: 9, scope: !56)
!64 = !DILocation(line: 55, column: 20, scope: !56)
!65 = !DILocation(line: 56, column: 19, scope: !56)
!66 = !DILocation(line: 56, column: 9, scope: !56)
!67 = !DILocation(line: 58, column: 1, scope: !52)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_41_good", scope: !14, file: !14, line: 72, type: !36, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 74, column: 5, scope: !68)
!70 = !DILocation(line: 75, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !72, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !14, line: 87, type: !74)
!77 = !DILocation(line: 87, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !14, line: 87, type: !75)
!79 = !DILocation(line: 87, column: 27, scope: !71)
!80 = !DILocation(line: 90, column: 22, scope: !71)
!81 = !DILocation(line: 90, column: 12, scope: !71)
!82 = !DILocation(line: 90, column: 5, scope: !71)
!83 = !DILocation(line: 92, column: 5, scope: !71)
!84 = !DILocation(line: 93, column: 5, scope: !71)
!85 = !DILocation(line: 94, column: 5, scope: !71)
!86 = !DILocation(line: 97, column: 5, scope: !71)
!87 = !DILocation(line: 98, column: 5, scope: !71)
!88 = !DILocation(line: 99, column: 5, scope: !71)
!89 = !DILocation(line: 101, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 61, type: !36, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !14, line: 63, type: !4)
!92 = !DILocation(line: 63, column: 12, scope: !90)
!93 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !14, line: 64, type: !4)
!94 = !DILocation(line: 64, column: 12, scope: !90)
!95 = !DILocation(line: 64, column: 33, scope: !90)
!96 = !DILocation(line: 65, column: 12, scope: !90)
!97 = !DILocation(line: 65, column: 10, scope: !90)
!98 = !DILocation(line: 67, column: 12, scope: !90)
!99 = !DILocation(line: 67, column: 5, scope: !90)
!100 = !DILocation(line: 68, column: 5, scope: !90)
!101 = !DILocation(line: 68, column: 16, scope: !90)
!102 = !DILocation(line: 69, column: 82, scope: !90)
!103 = !DILocation(line: 69, column: 5, scope: !90)
!104 = !DILocation(line: 70, column: 1, scope: !90)
