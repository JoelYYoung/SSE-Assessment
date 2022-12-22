; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  %6 = load i8*, i8** %data, align 8, !dbg !36
  %call = call i64 @strlen(i8* %6) #7, !dbg !37
  %mul = mul i64 %call, 1, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !34
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !39
  store i8 0, i8* %arrayidx1, align 1, !dbg !40
  %7 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* %7), !dbg !42
  ret void, !dbg !43
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_01_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #8, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #8, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_01_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_01_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 100, align 16, !dbg !71
  store i8* %0, i8** %dataBuffer, align 8, !dbg !70
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !72
  store i8* %1, i8** %data, align 8, !dbg !73
  %2 = load i8*, i8** %data, align 8, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !75
  %3 = load i8*, i8** %data, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !78, metadata !DIExpression()), !dbg !80
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !80
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !81
  %5 = load i8*, i8** %data, align 8, !dbg !82
  %6 = load i8*, i8** %data, align 8, !dbg !83
  %call = call i64 @strlen(i8* %6) #7, !dbg !84
  %mul = mul i64 %call, 1, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !81
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !86
  store i8 0, i8* %arrayidx1, align 1, !dbg !87
  %7 = load i8*, i8** %data, align 8, !dbg !88
  call void @printLine(i8* %7), !dbg !89
  ret void, !dbg !90
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_01.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_01_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_01.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 29, column: 12, scope: !13)
!25 = !DILocation(line: 29, column: 5, scope: !13)
!26 = !DILocation(line: 30, column: 5, scope: !13)
!27 = !DILocation(line: 30, column: 17, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 32, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 32, column: 14, scope: !29)
!34 = !DILocation(line: 34, column: 9, scope: !29)
!35 = !DILocation(line: 34, column: 22, scope: !29)
!36 = !DILocation(line: 34, column: 35, scope: !29)
!37 = !DILocation(line: 34, column: 28, scope: !29)
!38 = !DILocation(line: 34, column: 40, scope: !29)
!39 = !DILocation(line: 35, column: 9, scope: !29)
!40 = !DILocation(line: 35, column: 20, scope: !29)
!41 = !DILocation(line: 36, column: 19, scope: !29)
!42 = !DILocation(line: 36, column: 9, scope: !29)
!43 = !DILocation(line: 38, column: 1, scope: !13)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_01_good", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 64, column: 5, scope: !44)
!46 = !DILocation(line: 65, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 77, type: !48, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !14, line: 77, type: !50)
!53 = !DILocation(line: 77, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !14, line: 77, type: !51)
!55 = !DILocation(line: 77, column: 27, scope: !47)
!56 = !DILocation(line: 80, column: 22, scope: !47)
!57 = !DILocation(line: 80, column: 12, scope: !47)
!58 = !DILocation(line: 80, column: 5, scope: !47)
!59 = !DILocation(line: 82, column: 5, scope: !47)
!60 = !DILocation(line: 83, column: 5, scope: !47)
!61 = !DILocation(line: 84, column: 5, scope: !47)
!62 = !DILocation(line: 87, column: 5, scope: !47)
!63 = !DILocation(line: 88, column: 5, scope: !47)
!64 = !DILocation(line: 89, column: 5, scope: !47)
!65 = !DILocation(line: 91, column: 5, scope: !47)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 45, type: !15, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 47, type: !4)
!68 = !DILocation(line: 47, column: 12, scope: !66)
!69 = !DILocalVariable(name: "dataBuffer", scope: !66, file: !14, line: 48, type: !4)
!70 = !DILocation(line: 48, column: 12, scope: !66)
!71 = !DILocation(line: 48, column: 33, scope: !66)
!72 = !DILocation(line: 49, column: 12, scope: !66)
!73 = !DILocation(line: 49, column: 10, scope: !66)
!74 = !DILocation(line: 51, column: 12, scope: !66)
!75 = !DILocation(line: 51, column: 5, scope: !66)
!76 = !DILocation(line: 52, column: 5, scope: !66)
!77 = !DILocation(line: 52, column: 16, scope: !66)
!78 = !DILocalVariable(name: "dest", scope: !79, file: !14, line: 54, type: !30)
!79 = distinct !DILexicalBlock(scope: !66, file: !14, line: 53, column: 5)
!80 = !DILocation(line: 54, column: 14, scope: !79)
!81 = !DILocation(line: 56, column: 9, scope: !79)
!82 = !DILocation(line: 56, column: 22, scope: !79)
!83 = !DILocation(line: 56, column: 35, scope: !79)
!84 = !DILocation(line: 56, column: 28, scope: !79)
!85 = !DILocation(line: 56, column: 40, scope: !79)
!86 = !DILocation(line: 57, column: 9, scope: !79)
!87 = !DILocation(line: 57, column: 20, scope: !79)
!88 = !DILocation(line: 58, column: 19, scope: !79)
!89 = !DILocation(line: 58, column: 9, scope: !79)
!90 = !DILocation(line: 60, column: 1, scope: !66)
