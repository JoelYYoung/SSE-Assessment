; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68_badData = external dso_local global i8*, align 8
@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68_goodG2BData = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !18, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %1 = load i8*, i8** %data, align 8, !dbg !27
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !28
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #5, !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx2, align 1, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  call void @printLine(i8* %3), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68b_goodG2BSink() #0 !dbg !35 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68_goodG2BData, align 8, !dbg !38
  store i8* %0, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  %1 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #5, !dbg !47
  %2 = load i8*, i8** %data, align 8, !dbg !48
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !48
  store i8 0, i8* %arrayidx2, align 1, !dbg !49
  %3 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* %3), !dbg !51
  ret void, !dbg !52
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 30, column: 12, scope: !9)
!17 = !DILocation(line: 30, column: 19, scope: !9)
!18 = !DILocalVariable(name: "source", scope: !19, file: !10, line: 32, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 32, column: 14, scope: !19)
!24 = !DILocation(line: 33, column: 9, scope: !19)
!25 = !DILocation(line: 34, column: 9, scope: !19)
!26 = !DILocation(line: 34, column: 23, scope: !19)
!27 = !DILocation(line: 36, column: 17, scope: !19)
!28 = !DILocation(line: 36, column: 23, scope: !19)
!29 = !DILocation(line: 36, column: 9, scope: !19)
!30 = !DILocation(line: 37, column: 9, scope: !19)
!31 = !DILocation(line: 37, column: 21, scope: !19)
!32 = !DILocation(line: 38, column: 19, scope: !19)
!33 = !DILocation(line: 38, column: 9, scope: !19)
!34 = !DILocation(line: 40, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_68b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocalVariable(name: "data", scope: !35, file: !10, line: 49, type: !14)
!37 = !DILocation(line: 49, column: 12, scope: !35)
!38 = !DILocation(line: 49, column: 19, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !40, file: !10, line: 51, type: !20)
!40 = distinct !DILexicalBlock(scope: !35, file: !10, line: 50, column: 5)
!41 = !DILocation(line: 51, column: 14, scope: !40)
!42 = !DILocation(line: 52, column: 9, scope: !40)
!43 = !DILocation(line: 53, column: 9, scope: !40)
!44 = !DILocation(line: 53, column: 23, scope: !40)
!45 = !DILocation(line: 55, column: 17, scope: !40)
!46 = !DILocation(line: 55, column: 23, scope: !40)
!47 = !DILocation(line: 55, column: 9, scope: !40)
!48 = !DILocation(line: 56, column: 9, scope: !40)
!49 = !DILocation(line: 56, column: 21, scope: !40)
!50 = !DILocation(line: 57, column: 19, scope: !40)
!51 = !DILocation(line: 57, column: 9, scope: !40)
!52 = !DILocation(line: 59, column: 1, scope: !35)
