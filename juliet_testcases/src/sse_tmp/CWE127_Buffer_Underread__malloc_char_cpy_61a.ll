; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_61a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %0 = load i8*, i8** %data, align 8, !dbg !20
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_cpy_61b_badSource(i8* %0), !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !23, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %call2 = call i8* @strcpy(i8* %arraydecay1, i8* %1) #5, !dbg !34
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !35
  call void @printLine(i8* %arraydecay3), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_cpy_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_61_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #5, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #5, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE127_Buffer_Underread__malloc_char_cpy_61_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE127_Buffer_Underread__malloc_char_cpy_61_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  store i8* null, i8** %data, align 8, !dbg !63
  %0 = load i8*, i8** %data, align 8, !dbg !64
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_cpy_61b_goodG2BSource(i8* %0), !dbg !65
  store i8* %call, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !67, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !70
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !71
  store i8 0, i8* %arrayidx, align 1, !dbg !72
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !73
  %1 = load i8*, i8** %data, align 8, !dbg !74
  %call2 = call i8* @strcpy(i8* %arraydecay1, i8* %1) #5, !dbg !75
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !76
  call void @printLine(i8* %arraydecay3), !dbg !77
  ret void, !dbg !78
}

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_cpy_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 28, column: 12, scope: !11)
!19 = !DILocation(line: 29, column: 10, scope: !11)
!20 = !DILocation(line: 30, column: 67, scope: !11)
!21 = !DILocation(line: 30, column: 12, scope: !11)
!22 = !DILocation(line: 30, column: 10, scope: !11)
!23 = !DILocalVariable(name: "dest", scope: !24, file: !12, line: 32, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 200)
!28 = !DILocation(line: 32, column: 14, scope: !24)
!29 = !DILocation(line: 33, column: 9, scope: !24)
!30 = !DILocation(line: 34, column: 9, scope: !24)
!31 = !DILocation(line: 34, column: 23, scope: !24)
!32 = !DILocation(line: 36, column: 16, scope: !24)
!33 = !DILocation(line: 36, column: 22, scope: !24)
!34 = !DILocation(line: 36, column: 9, scope: !24)
!35 = !DILocation(line: 37, column: 19, scope: !24)
!36 = !DILocation(line: 37, column: 9, scope: !24)
!37 = !DILocation(line: 41, column: 1, scope: !11)
!38 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_61_good", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 69, column: 5, scope: !38)
!40 = !DILocation(line: 70, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !42, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !12, line: 82, type: !44)
!47 = !DILocation(line: 82, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !12, line: 82, type: !45)
!49 = !DILocation(line: 82, column: 27, scope: !41)
!50 = !DILocation(line: 85, column: 22, scope: !41)
!51 = !DILocation(line: 85, column: 12, scope: !41)
!52 = !DILocation(line: 85, column: 5, scope: !41)
!53 = !DILocation(line: 87, column: 5, scope: !41)
!54 = !DILocation(line: 88, column: 5, scope: !41)
!55 = !DILocation(line: 89, column: 5, scope: !41)
!56 = !DILocation(line: 92, column: 5, scope: !41)
!57 = !DILocation(line: 93, column: 5, scope: !41)
!58 = !DILocation(line: 94, column: 5, scope: !41)
!59 = !DILocation(line: 96, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", scope: !60, file: !12, line: 52, type: !16)
!62 = !DILocation(line: 52, column: 12, scope: !60)
!63 = !DILocation(line: 53, column: 10, scope: !60)
!64 = !DILocation(line: 54, column: 71, scope: !60)
!65 = !DILocation(line: 54, column: 12, scope: !60)
!66 = !DILocation(line: 54, column: 10, scope: !60)
!67 = !DILocalVariable(name: "dest", scope: !68, file: !12, line: 56, type: !25)
!68 = distinct !DILexicalBlock(scope: !60, file: !12, line: 55, column: 5)
!69 = !DILocation(line: 56, column: 14, scope: !68)
!70 = !DILocation(line: 57, column: 9, scope: !68)
!71 = !DILocation(line: 58, column: 9, scope: !68)
!72 = !DILocation(line: 58, column: 23, scope: !68)
!73 = !DILocation(line: 60, column: 16, scope: !68)
!74 = !DILocation(line: 60, column: 22, scope: !68)
!75 = !DILocation(line: 60, column: 9, scope: !68)
!76 = !DILocation(line: 61, column: 19, scope: !68)
!77 = !DILocation(line: 61, column: 9, scope: !68)
!78 = !DILocation(line: 65, column: 1, scope: !60)
