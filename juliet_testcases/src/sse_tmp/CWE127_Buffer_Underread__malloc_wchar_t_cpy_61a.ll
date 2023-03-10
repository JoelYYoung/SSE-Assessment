; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_61a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %0 = load i32*, i32** %data, align 8, !dbg !22
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_61b_badSource(i32* %0), !dbg !23
  store i32* %call, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !25, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !31
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !32
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !35
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %1) #4, !dbg !37
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !38
  call void @printWLine(i32* %arraydecay4), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_61b_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_61_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #4, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #4, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_61_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_61_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i32* null, i32** %data, align 8, !dbg !67
  %0 = load i32*, i32** %data, align 8, !dbg !68
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_61b_goodG2BSource(i32* %0), !dbg !69
  store i32* %call, i32** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !71, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !74
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !75
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !77
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !78
  %1 = load i32*, i32** %data, align 8, !dbg !79
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %1) #4, !dbg !80
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !81
  call void @printWLine(i32* %arraydecay4), !dbg !82
  ret void, !dbg !83
}

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !11)
!21 = !DILocation(line: 29, column: 10, scope: !11)
!22 = !DILocation(line: 30, column: 70, scope: !11)
!23 = !DILocation(line: 30, column: 12, scope: !11)
!24 = !DILocation(line: 30, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dest", scope: !26, file: !12, line: 32, type: !27)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 200)
!30 = !DILocation(line: 32, column: 17, scope: !26)
!31 = !DILocation(line: 33, column: 17, scope: !26)
!32 = !DILocation(line: 33, column: 9, scope: !26)
!33 = !DILocation(line: 34, column: 9, scope: !26)
!34 = !DILocation(line: 34, column: 23, scope: !26)
!35 = !DILocation(line: 36, column: 16, scope: !26)
!36 = !DILocation(line: 36, column: 22, scope: !26)
!37 = !DILocation(line: 36, column: 9, scope: !26)
!38 = !DILocation(line: 37, column: 20, scope: !26)
!39 = !DILocation(line: 37, column: 9, scope: !26)
!40 = !DILocation(line: 41, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_61_good", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 69, column: 5, scope: !41)
!43 = !DILocation(line: 70, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !45, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!19, !19, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 82, type: !19)
!51 = !DILocation(line: 82, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 82, type: !47)
!53 = !DILocation(line: 82, column: 27, scope: !44)
!54 = !DILocation(line: 85, column: 22, scope: !44)
!55 = !DILocation(line: 85, column: 12, scope: !44)
!56 = !DILocation(line: 85, column: 5, scope: !44)
!57 = !DILocation(line: 87, column: 5, scope: !44)
!58 = !DILocation(line: 88, column: 5, scope: !44)
!59 = !DILocation(line: 89, column: 5, scope: !44)
!60 = !DILocation(line: 92, column: 5, scope: !44)
!61 = !DILocation(line: 93, column: 5, scope: !44)
!62 = !DILocation(line: 94, column: 5, scope: !44)
!63 = !DILocation(line: 96, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !12, line: 52, type: !16)
!66 = !DILocation(line: 52, column: 15, scope: !64)
!67 = !DILocation(line: 53, column: 10, scope: !64)
!68 = !DILocation(line: 54, column: 74, scope: !64)
!69 = !DILocation(line: 54, column: 12, scope: !64)
!70 = !DILocation(line: 54, column: 10, scope: !64)
!71 = !DILocalVariable(name: "dest", scope: !72, file: !12, line: 56, type: !27)
!72 = distinct !DILexicalBlock(scope: !64, file: !12, line: 55, column: 5)
!73 = !DILocation(line: 56, column: 17, scope: !72)
!74 = !DILocation(line: 57, column: 17, scope: !72)
!75 = !DILocation(line: 57, column: 9, scope: !72)
!76 = !DILocation(line: 58, column: 9, scope: !72)
!77 = !DILocation(line: 58, column: 23, scope: !72)
!78 = !DILocation(line: 60, column: 16, scope: !72)
!79 = !DILocation(line: 60, column: 22, scope: !72)
!80 = !DILocation(line: 60, column: 9, scope: !72)
!81 = !DILocation(line: 61, column: 20, scope: !72)
!82 = !DILocation(line: 61, column: 9, scope: !72)
!83 = !DILocation(line: 65, column: 1, scope: !64)
